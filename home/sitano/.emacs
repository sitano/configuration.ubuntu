; Default encoding
(setq set-buffer-file-coding-system 'unix)

; Def load path
(add-to-list 'load-path "~/.emacs.d")

; IDO
(setq ido-enable-flex-matching t)
(ido-mode 'both)

; No toolbar and scrollbar
(scroll-bar-mode -1)
(tool-bar-mode -1)

; Parens
(show-paren-mode 1)

; Setul tabs and indents
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)
(setq indent-line-function 'indent-relative)

; Switching windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

(defun my-indent-region (N)
  (interactive "p")
  (if mark-active
      (progn (indent-rigidly (min (mark) (point)) (max (mark) (point)) (* N 4))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun my-unindent-region (N)
  (interactive "p")
  (if mark-active
      (progn (indent-rigidly (min (mark) (point)) (max (mark) (point)) (* N -4))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(global-set-key ">" 'my-indent-region)
(global-set-key "<" 'my-unindent-region)

; Windows numbers
(require 'window-number)
(window-number-mode 1)

; No backup files
(setq make-backup-files nil)

; Save place in closed files
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

; Move cursor to the last available pos on scrollint
(setq scroll-error-top-bottom t)

; Handle .gz files
(auto-compression-mode t)

; Provide templates for new files
(auto-insert-mode t)

; Line numbers
(require 'linum)
(global-linum-mode 1)

; Whitespace
(require 'whitespace)
(global-whitespace-mode 1) 

; Color theme
(when (featurep 'color-theme)
  (require 'color-theme))
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized-master")
(load-theme 'solarized-dark t)

(setq inhibit-startup-screen t)
(custom-set-faces)

; Puppet mode
(require 'puppet-mode)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

; Erlang mode
(when (file-exists-p "/usr/local/lib/erlang")
    (setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.8/emacs" load-path))
    (setq erlang-root-dir "/usr/local/lib/erlang")
    (setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
    (require 'erlang-start))

(when (file-exists-p "/usr/lib/erlang")
    (setq load-path (cons "/usr/lib/erlang/lib/tools-2.6.7/emacs" load-path))
    (setq erlang-root-dir "/usr/lib/erlang")
    (setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
    (require 'erlang-start))

; Distel
;(setq load-path (cons  "/usr/lib/erlang/lib/tools-2.6.7/emacs/"
;     load-path))
;(setq erlang-root-dir "/usr/lib/erlang")
;(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;(require 'erlang-start)
;
;(add-to-list 'load-path "~/.emacs.d/distel/elisp")
;(require 'distel)
;(distel-setup)

;; A number of the erlang-extended-mode key bindings are useful in the shell too
;(defconst distel-shell-keys
;  '(("\C-\M-i"   erl-complete)
;    ("\M-?"      erl-complete)
;    ("\M-."      erl-find-source-under-point)
;    ("\M-,"      erl-find-source-unwind)
;    ("\M-*"      erl-find-source-unwind)
;    )
;  "Additional keys to bind when in Erlang shell.")

;(add-hook 'erlang-shell-mode-hook
;(lambda ()
;  ;; add some Distel bindings to the Erlang shell
;  (dolist (spec distel-shell-keys)
;  (define-key erlang-shell-mode-map (car spec) (cadr spec)))))
