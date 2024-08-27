;;; .emacs --- Susam's Emacs initialisation file!

;; Copyright (c) 2005-2024 Susam Pal

;; Author: Susam Pal
;; URL: https://github.com/susam/dotfiles

;; This is free and open source software available under the terms of
;; the MIT license <https://opensource.org/license/mit>.

;;; Commentary:

;; My Emacs initialisation file!

;;; Code:


;;; Benchmarking =====================================================

(defvar .emacs-begin-time (current-time))
(defvar .emacs-end-time nil)


;;; Look and Feel ====================================================

;; Customise user interface.
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(setq inhibit-startup-screen t)
(column-number-mode)

;; Disable startup message in echo area too.  One of the things that
;; `display-startup-echo-area-message' checks is that the property
;; `saved-value' exists in `inhibit-startup-echo-area-message' before
;; honouring the latter and disabling the echo area startup message.
(custom-set-variables '(inhibit-startup-echo-area-message (user-login-name)))

;; Do not display file icon or name on title bar.
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format "Emacs")

;; Dark theme.
(load-theme 'wombat)

;; Customise theme.
(with-eval-after-load 'wombat-theme
  ;; Better colours.
  (set-face-attribute 'menu nil :background "#444" :foreground "#eee")
  (set-face-attribute 'default nil :background "#111" :foreground "#eee")
  (set-face-attribute 'region nil :background "#354" :foreground "#eee")
  (set-face-attribute 'isearch nil :background "#ff0" :foreground "#000")
  (set-face-attribute 'lazy-highlight nil :background "#990" :foreground "#000")
  (set-face-attribute 'mode-line nil :background "#444" :foreground "#ccc")
  (set-face-attribute 'mode-line-inactive nil :background "#222" :foreground "#999")
  (set-face-background 'cursor "#c96")
  (set-face-foreground 'font-lock-comment-face "#fc0")
  ;; Customise attributes to suit dark theme.
  (set-face-attribute 'menu nil :inverse-video nil)
  (set-face-attribute 'mode-line nil :box '(:style released-button))
  (set-face-attribute 'mode-line-inactive nil :box '(:style pressed-button)))

;; Remove background colours in diff mode.
(with-eval-after-load 'diff-mode
  (set-face-attribute 'diff-context nil :foreground "#ccc")
  (set-face-attribute 'diff-added nil :background nil :foreground "#6c6")
  (set-face-attribute 'diff-removed nil :background nil :foreground "#c66")
  (set-face-attribute 'diff-header nil :background nil :foreground "#fc0"))

;; Enable line numbers in certain types of buffers.
(dolist (hook '(prog-mode-hook conf-mode-hook text-mode-hook))
  (add-hook hook 'display-line-numbers-mode))

;; Maximize the frame.
(set-frame-parameter nil 'fullscreen 'maximized)

;; 256 colors in terminal.
(add-hook 'term-mode-hook #'eterm-256color-mode)

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; View PDFs in high resolution.
(with-eval-after-load 'doc-view
  (setopt doc-view-resolution 300))

;; Do not use "Monospace" (which falls back on "courier" via
;; face-font-family-alternatives) for markdown-code-face,
;; markdown-inline-code-face, etc.  Use default font instead.
;;
;; To confirm the above details try:
;;
;;   - M-x load-library markdown-mode RET
;;   - M-. markdown-code-face RET (observe "fixed-pitch")
;;   - M-. fixed-pitch RET (observe "Monospace")
;;   - C-h v face-font-family-alternatives RET (observe "courier")
(set-face-attribute 'fixed-pitch nil :family 'unspecified)


;;; Completions ======================================================

;; Interactively do things.
(fido-vertical-mode)

;; Suppress current/total prefix before minibuffer prompt.
(setopt icomplete-matches-format nil)


;;; Tabs and Whitespace  =============================================

;; Show trailing whitespace while writing config, code, or text.
(dolist (hook '(conf-mode-hook prog-mode-hook text-mode-hook))
  (add-hook hook (lambda () (setq show-trailing-whitespace t))))

;; Show stray lines.
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

;; Add a newline automatically at the end of a file while saving.
(setq-default require-final-newline t)

;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)

;; Display the distance between two tab stops as 4 characters wide.
(setq-default tab-width 4)

;; Indentation setting for various languages.
(setopt c-basic-offset 4)
(setopt js-indent-level 2)
(setopt css-indent-offset 2)


;;; Clean Files and Directories ======================================

;; Write auto-saves and backups to separate directory.
(make-directory "~/.tmp/emacs/auto-save/" t)
(setq auto-save-file-name-transforms '((".*" "~/.tmp/emacs/auto-save/" t)))
(setq backup-directory-alist '(("." . "~/.tmp/emacs/backup/")))

;; Do not move the current file while creating backup.
(setq backup-by-copying t)

;; Disable lockfiles.
(setq create-lockfiles nil)

;; Write customizations to a separate file instead of this file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Always follow symbolic links to a file under version control.
(setq vc-follow-symlinks t)


;;; Org ==============================================================

(with-eval-after-load 'org
  ;; Set the list of agenda files.
  (setopt org-agenda-files '("~/my/plan/"))
  ;; Let C-c C-v C-b, C-c C-c, etc. evaluate code blocks without confirmation.
  (setopt org-confirm-babel-evaluate nil)
  ;; Disable auto isearch to navigate using q/n/p/f/b/u after typing C-c C-j.
  (setopt org-goto-auto-isearch nil)
  ;; Do not log changes when marking a recurring task to done with C-c C-t.
  (setopt org-log-repeat nil))

(with-eval-after-load 'org-agenda
  ;; Set the list of agenda files.
  ;; Show only one day of data in agenda overview on typing C-c a a.
  (setopt org-agenda-span 'day)
  ;; Start agenda overview on Sunday on typing C-c a a w.
  (setopt org-agenda-start-on-weekday 0))

(with-eval-after-load 'org-capture
  (setopt org-capture-templates
          '(("t" "Task" entry
             (file+headline "~/my/plan/in.org" "Inbox")
             "* %u %?"))))

(with-eval-after-load 'org-refile
  (setopt org-refile-targets '((org-agenda-files :level . 1)))
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  (advice-add 'org-refile :after 'org-refile-goto-last-stored))

(with-eval-after-load 'org-archive
  (let ((path "~/my/plan/archive.org"))
    (setopt org-archive-location (format  "%s::* Archived" path))
    (advice-add 'org-archive-subtree :after 'org-save-all-org-buffers)
    (advice-add 'org-archive-subtree :after `(lambda () (find-file ,path)))))


;;; TeX and LaTeX ====================================================

;; BibTeX.
(with-eval-after-load 'bibtex
  (setopt bibtex-align-at-equal-sign t))


;;; New Utilities  ===================================================

(defmacro cmd (&rest body)
  "Create an interactive command to execute BODY."
  `(lambda ()
     (interactive)
     ,@body))


;;; New Commands =====================================================

(defun set-font-size (pt)
  "Set default font size to PT points."
  (interactive "nFont Size: ")
  (set-face-attribute 'default nil :height (* 10 pt)))

(defun prepare-for-debugging ()
  "Prepare current frame for debugging."
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized)
  (delete-other-windows)
  (switch-to-buffer "*Messages*")
  (split-window-right)
  (find-file "~/.emacs"))

;; Set PATH for shell-command, compile, etc.
(setenv "PATH" (concat (getenv "PATH")
                       ":" (expand-file-name "~/bin/")
                       ":" (expand-file-name "~/my/bin/")))

(defun wrap-in-html-paragraph ()
  "Wrap the current paragraph with <p> tags."
  (interactive)
  (backward-paragraph)
  (open-line 1)
  (insert "<p>")
  (indent-for-tab-command)
  (forward-paragraph)
  (open-line 1)
  (insert "</p>")
  (indent-for-tab-command)
  (forward-line -1)
  (mark-paragraph)
  (indent-for-tab-command)
  (fill-paragraph))

(defun show-init-time ()
  "Show time spent in initialising Emacs."
  (interactive)
  (let ((init-time (float-time (time-subtract after-init-time before-init-time)))
        (this-time (float-time (time-subtract .emacs-end-time .emacs-begin-time))))
    (message "init-time: %.3f s; .emacs-time: %.3f s" init-time this-time)))


;;; Key Bindings =====================================================

;; Custom key sequences.
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") (cmd (message (buffer-file-name))))
(global-set-key (kbd "C-c c") (cmd (org-capture nil "t")))
(global-set-key (kbd "C-c d") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c e d") (cmd (find-file "~/my/dd.org")))
(global-set-key (kbd "C-c e e") (cmd (find-file "~/.emacs")))
(global-set-key (kbd "C-c e s") (cmd (find-file "~/scratch.md")))
(global-set-key (kbd "C-c e t") (cmd (find-file "~/my/time.org")))
(global-set-key (kbd "C-c f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c h w p") 'wrap-in-html-paragraph)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c m") 'toggle-frame-maximized)
(global-set-key (kbd "C-c o a") (cmd (find-file "~/my/plan/archive.org")))
(global-set-key (kbd "C-c o c") (cmd (find-file "~/my/plan/cal.org")))
(global-set-key (kbd "C-c o i") (cmd (find-file "~/my/plan/in.org")))
(global-set-key (kbd "C-c o n") (cmd (find-file "~/my/plan/next.org")))
(global-set-key (kbd "C-c o p") (cmd (find-file "~/my/plan/project.org")))
(global-set-key (kbd "C-c o s") (cmd (find-file "~/my/plan/someday.org")))
(global-set-key (kbd "C-c o w") (cmd (find-file "~/my/plan/waiting.org")))
(global-set-key (kbd "C-c n") 'display-line-numbers-mode)
(global-set-key (kbd "C-c p d") 'prepare-for-debugging)
(global-set-key (kbd "C-c r f") 'recover-this-file)
(global-set-key (kbd "C-c r s") 'slime-restart-inferior-lisp)
(global-set-key (kbd "C-c s i") 'show-init-time)
(global-set-key (kbd "C-c s f") 'set-font-size)
(global-set-key (kbd "C-c s t") (cmd (message (current-time-string))))
(global-set-key (kbd "C-c t p") 'transpose-paragraphs)
(global-set-key (kbd "C-c t s") 'transpose-sentences)
(global-set-key (kbd "C-c t t") 'toggle-truncate-lines)
(global-set-key (kbd "C-c w") 'whitespace-mode)


;;; Start Emacs Server ===============================================

(require 'server)
(unless (server-running-p)
  (server-start))


;;; External Packages ================================================

(defun setup ()
  "Install and set up packages for the first time."
  (interactive)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)
  (package-refresh-contents)
  (dolist (package '(devil
                     dumb-jump
                     eterm-256color
                     flycheck
                     flycheck-package
                     helm
                     markdown-mode
                     paredit
                     rainbow-delimiters
                     rust-mode
                     slime
                     zig-mode))
    (unless (package-installed-p package)
      (package-install package))))


;;; Devil ============================================================

(when (fboundp 'devil-mode)
  (global-devil-mode))


;;; Dumb Jump ========================================================

(when (fboundp 'dumb-jump-mode)
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))


;;; Flycheck  ========================================================

(when (fboundp 'flycheck-mode)
  (global-flycheck-mode))


;;; Paredit ==========================================================

;; Enable Paredit on all Lisp modes.
(when (fboundp 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
  (add-hook 'ielm-mode-hook 'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
  (add-hook 'lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'slime-repl-mode-hook 'enable-paredit-mode))

;; Do not bind RET to paredit-RET which prevents input from being
;; evaluated on RET in M-:, ielm, etc.
(with-eval-after-load 'paredit
  (defvar paredit-mode-map)
  (define-key paredit-mode-map (kbd "RET") nil))


;;; Rainbow Delimiters ===============================================

(when (fboundp 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode))

(with-eval-after-load 'rainbow-delimiters
  (set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
  (set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
  (set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
  (set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
  (set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
  (set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
  (set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
  (set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
  (set-face-foreground 'rainbow-delimiters-depth-9-face "#666")) ; dark gray


;;; SLIME ============================================================

(with-eval-after-load 'slime
  (setopt inferior-lisp-program "sbcl")
  (add-to-list 'slime-contribs 'slime-banner)
  (add-hook 'slime-repl-mode-hook 'override-slime-del-key))

(defun override-slime-del-key ()
  "Prevent SLIME from interfering with Paredit's DEL key."
  (defvar slime-repl-mode-map)
  (defvar paredit-backward-delete-key)
  (define-key slime-repl-mode-map
              (read-kbd-macro paredit-backward-delete-key) nil))


;;; Optionals ========================================================

(load "~/.opt.el" t)


;;; Benchmark Results ================================================

(setq .emacs-end-time (current-time))
(show-init-time)

(provide '.emacs)

;;; .emacs ends here
