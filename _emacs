;;; My Emacs!

;; Customize user interface.
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(setq inhibit-startup-screen t)
(column-number-mode)

(setq doc-view-resolution 300)

;; Do not display file icon or name on title bar.
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format "Emacs")

;; Dark theme colours.
(load-theme 'wombat)
(set-face-attribute 'menu nil :background "#444" :foreground "#eee")
(set-face-attribute 'default nil :background "#111" :foreground "#eee")
(set-face-attribute 'region nil :background "#354" :foreground "#eee")
(set-face-attribute 'isearch nil :background "#ff0" :foreground "#000")
(set-face-attribute 'lazy-highlight nil :background "#990" :foreground "#000")
(set-face-attribute 'mode-line nil :background "#444" :foreground "#ccc")
(set-face-attribute 'mode-line-inactive nil :background "#222" :foreground "#999")
(set-face-background 'cursor "#c96")
(set-face-foreground 'font-lock-comment-face "#fc0")

;; Dark theme attributes.
(set-face-attribute 'menu nil :inverse-video nil)
(set-face-attribute 'mode-line nil :box '(:style released-button))
(set-face-attribute 'mode-line-inactive nil :box '(:style pressed-button))

;; Diff colors.
(require 'diff-mode)
(set-face-attribute 'diff-context nil :foreground "#ccc")
(set-face-attribute 'diff-added nil :background nil :foreground "#6c6")
(set-face-attribute 'diff-removed nil :background nil :foreground "#c66")
(set-face-attribute 'diff-header nil :background nil :foreground "#fc0")

;; Do not use "Monospace" (which falls back on "courier" via
;; face-font-family-alternatives) for org-table, org-block,
;; org-meta-line, etc.  Use default font instead.
(set-face-attribute 'fixed-pitch nil :family 'unspecified)

;; Interactively do things.
(ido-mode 1)
(ido-everywhere)
(setq ido-enable-flex-matching t)
(fido-mode)

;; Enable line numbers in certain types of buffers.
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'conf-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

;; Show stray whitespace.
(setq-default show-trailing-whitespace nil)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)
(add-hook 'term-mode-hook (lambda () (setq-default show-trailing-whitespace nil)))

;; Consider a period followed by a single space to be end of sentence.
;(setq sentence-end-double-space t)
;(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local sentence-end-double-space t)))
;(add-hook 'org-mode-hook (lambda () (setq-local sentence-end-double-space t)))

;; 256 colors in terminal.
(add-hook 'term-mode-hook #'eterm-256color-mode)

;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)

;; Display the distance between two tab stops as 4 characters wide.
(setq-default tab-width 4)

;; Indentation setting for various languages.
(setq c-basic-offset 4)
(setq js-indent-level 2)
(setq css-indent-offset 2)

;; Add a newline automatically at the end of a file while saving.
(setq-default require-final-newline t)

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Write auto-saves and backups to separate directory.
(make-directory "~/.tmp/emacs/auto-save/" t)
(setq auto-save-file-name-transforms '((".*" "~/.tmp/emacs/auto-save/" t)))
(setq backup-directory-alist '(("." . "~/.tmp/emacs/backup/")))

;; Do not move the current file while creating backup.
(setq backup-by-copying t)

;; Disable lockfiles.
(setq create-lockfiles nil)

;; Workaround for https://debbugs.gnu.org/34341 in GNU Emacs <= 26.3.
(when (and (version< emacs-version "26.3") (>= libgnutls-version 30603))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; Write customizations to a separate file instead of this file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Always follow symbolic links to a file under version control.
(setq vc-follow-symlinks t)

;; Enable installation of packages from MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install packages.
(dolist (package '(markdown-mode
                   paredit
                   rainbow-delimiters
                   slime
                   helm
                   eterm-256color
                   devil
                   flycheck
                   flycheck-package
                   zig-mode
                   rust-mode
                   dumb-jump))
  (unless (package-installed-p package)
    (package-install package)))

;; Enable Devil.
(global-devil-mode)
(global-set-key (kbd "C-,") 'global-devil-mode)

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; Configure SBCL as the Lisp program for SLIME.
(add-to-list 'exec-path "/usr/local/bin/")
(add-to-list 'exec-path "/opt/homebrew/bin/")
(setq inferior-lisp-program "sbcl")

;; Enable window header line and startup animation.
(add-to-list 'slime-contribs 'slime-banner)

;; Enable Paredit.
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
(defun override-slime-del-key ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-del-key)

;; Do not bind RET to paredit-RET which prevents input from being
;; evaluated on RET in M-:, ielm, etc.
(require 'paredit)
(define-key paredit-mode-map (kbd "RET") nil)

;; Enable Rainbow Delimiters.
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)

;; Customize Rainbow Delimiters.
(require 'rainbow-delimiters)
(set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
(set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
(set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
(set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
(set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
(set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
(set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
(set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
(set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray

;; Customize Org-mode.
(require 'org-faces)

;; Disable auto isearch to navigate using q/n/p/f/b/u after typing C-c C-j.
(setq org-goto-auto-isearch nil)

;; BibTeX.
(setq bibtex-align-at-equal-sign t)

;; Custom commands.
(defmacro cmd (&rest body)
  `(lambda ()
     (interactive)
     ,@body))

(defun set-font-size (pt)
  "Set default font size."
  (interactive "nFont Size: ")
  (set-face-attribute 'default nil :height (* 10 pt)))

;; Custom key sequences.
(global-set-key (kbd "C-c b") (cmd (message (buffer-file-name))))
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c d") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c e t")  (cmd (find-file "~/my/time.org")))
(global-set-key (kbd "C-c e d")  (cmd (find-file "~/my/dd.org")))
(global-set-key (kbd "C-c e s")  (cmd (find-file "~/scratch.md")))
(global-set-key (kbd "C-c f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c l") 'display-line-numbers-mode)
(global-set-key (kbd "C-c m") 'toggle-frame-maximized)
(global-set-key (kbd "C-c o u") 'browse-url-of-file)
(global-set-key (kbd "C-c r f") 'recover-this-file)
(global-set-key (kbd "C-c r s") 'slime-restart-inferior-lisp)
(global-set-key (kbd "C-c s f") 'set-font-size)
(global-set-key (kbd "C-c s t") (cmd (message (current-time-string))))
(global-set-key (kbd "C-c t p") 'transpose-paragraphs)
(global-set-key (kbd "C-c t s") 'transpose-sentences)
(global-set-key (kbd "C-c t t") 'toggle-truncate-lines)
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; Flycheck.
(global-flycheck-mode)
(eval-after-load 'flycheck '(flycheck-package-setup))

;; Load workspace-local configuration.
(load "~/extra.el" t)
(load "~/local.el" t)

;; Start server.
(require 'server)
(unless (server-running-p)
  (server-start))

;; Set PATH for shell-command, compile, etc.
(setenv "PATH" (concat (getenv "PATH")
                       ":" (expand-file-name "~/bin/")
                       ":" (expand-file-name "~/my/bin/")))

(defun wrap-in-html-p ()
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

(global-set-key (kbd "C-c h w p") 'wrap-in-html-p)
