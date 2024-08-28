;;; .opt --- Susam's optional initialisation file!

;; Copyright (c) 2005-2024 Susam Pal

;; Author: Susam Pal
;; URL: https://github.com/susam/dotfiles

;; This is free and open source software available under the terms of
;; the MIT license <https://opensource.org/license/mit>.

;;; Commentary:

;; My optional initialisation file!

;;; Code:


;;; Optional Packages ================================================

(defun install-opt-packages ()
  "Install optional packages."
  (interactive)
  (require 'package)
  (defvar package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (dolist (package '(dockerfile-mode
                     docker-compose-mode
                     magit
                     sqlup-mode
                     rust-mode
                     go-mode
                     groovy-mode
                     terraform-mode))
    (unless (package-installed-p package)
      (package-install package))))


;;; SQL UP ===========================================================

(when (fboundp 'sqlup-mode)
  (add-hook 'sql-mode-hook 'sqlup-mode)
  (add-hook 'sql-interactive-mode-hook 'sqlup-mode))

(with-eval-after-load 'sqlup-mode
  (defvar sqlup-blacklist)
  (add-to-list 'sqlup-blacklist "name"))


;;; The End ==========================================================

(provide '.opt)

;;; .opt.el ends here
