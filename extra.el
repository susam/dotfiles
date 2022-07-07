;;; Extra Emacs Setup!

;; Enable menu bar.
(menu-bar-mode)

;; Enable line numbers in certain type of buffers.
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'conf-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

;; Additional packages to install.
(defvar extra-package-list '(all-the-icons
                             doom-modeline
                             dockerfile-mode
                             docker-compose-mode
                             sqlup-mode))

;; Install packages.
(dolist (package extra-package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Install fonts for doom-modeline.
(when (display-graphic-p)
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t)))

;; Enable doom-modeline.
(doom-modeline-mode)

;; Configure sqlup-mode.
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
(require 'sqlup-mode)
(add-to-list 'sqlup-blacklist "name")

;; Custom keys.
(global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)
