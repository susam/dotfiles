;;; Extra Emacs Setup!

(menu-bar-mode)

;; Additional packages to install.
(defvar extra-package-list '(all-the-icons
                             doom-modeline
                             dockerfile-mode
                             docker-compose-mode))

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
