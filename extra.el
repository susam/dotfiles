;;; Extra Emacs Setup!

;; Additional packages to install.
(defvar extra-package-list '(dockerfile-mode
                             docker-compose-mode
                             magit
                             sqlup-mode
                             rust-mode
                             go-mode
                             groovy-mode
                             terraform-mode))

;(setq groovy-indent-offset 4)

;; Let C-c C-v C-b, C-c C-c, etc. evaluate without confirmation.
(setq org-confirm-babel-evaluate nil)

;; Install packages.
(dolist (package extra-package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Install fonts for doom-modeline.
(when (display-graphic-p)
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t)))

;; Configure sqlup-mode.
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
(require 'sqlup-mode)
(add-to-list 'sqlup-blacklist "name")
(global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)
