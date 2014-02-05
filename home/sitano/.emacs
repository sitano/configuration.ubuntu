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

; Setup tabs and indents
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)
;(setq indent-line-function 'indent-relative)

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

; Duplicate line
(require 'duplicate-line)
(global-set-key "\C-c\C-d" 'duplicate-line)

; Color theme
(when (featurep 'color-theme)
  (require 'color-theme))
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized-master")
(load-theme 'solarized-dark t)

(setq inhibit-startup-screen t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-indentation ((t (:foreground "#073642"))))
 '(whitespace-space ((t (:foreground "#073642"))))
 '(whitespace-tab ((t (:foreground "#073642")))))

; Puppet mode
(require 'puppet-mode)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

; Erlang mode
(when (file-exists-p "/usr/lib/erlang")
    (setq load-path (cons "/usr/lib/erlang/lib/tools-2.6.11/emacs" load-path))
    (setq erlang-root-dir "/usr/lib/erlang")
    (setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
    (require 'erlang-start))

(add-hook 'erlang-mode-hook
             (lambda ()
            ;; when starting an Erlang shell in Emacs, the node name
            ;; by default should be "emacs"
            (setq inferior-erlang-machine-options '("-sname" "emacs"))
            ;; add Erlang functions to an imenu menu
            (imenu-add-to-menubar "imenu")))

; Distel
(let ((distel-dir "~/.emacs.d/distel/elisp"))
  (unless (member distel-dir load-path)
    (setq load-path (append load-path (list distel-dir)))))
(require 'distel)
(distel-setup)

;; Some Erlang customizations
(add-hook 'erlang-mode-hook
          (lambda ()
            ;; when starting an Erlang shell in Emacs, default in the node name
            (setq inferior-erlang-machine-options '("-sname" "emacs"))
            ;; add Erlang functions to an imenu menu
            (imenu-add-to-menubar "imenu")))
;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")
(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;; add some Distel bindings to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(quack-programs (quote ("racket" "bigloo" "csi" "csi -hygienic" "drracket" "gosh" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mred -z" "mzscheme" "mzscheme -M errortrace" "mzscheme -il r6rs" "mzscheme -il typed-scheme" "mzscheme3m" "mzschemecgc" "rcracket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(whitespace-line-column 1024)
 '(whitespace-style (quote (face tabs spaces trailing space-before-tab newline indentation space-after-tab space-mark tab-mark newline-mark))))

; Flymake
(require 'flymake)
(setq flymake-log-level 3)

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name temp-file
		(file-name-directory buffer-file-name))))
    (list "~/.emacs.d/eflymake-master/eflymake" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))

(defun my-erlang-mode-hook () (flymake-mode 1))
(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

; AutoComplete 1.3.1
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/dict")
(ac-config-default)

; Go
(add-to-list 'load-path "~/.emacs.d/go")
(require 'go-mode-load)

; Goflymake
(add-to-list 'load-path "~/Projects/gocode/src/github.com/dougm/goflymake")
(require 'go-flymake)

; Goflycheck (required flycheck, install via cask)
;(add-to-list 'load-path "~/.emacs.d/goflymake")
;(require 'go-flycheck)

; Gocode
(add-to-list 'load-path "~/Projects/gocode/src/github.com/nsf/gocode/emacs")
(require 'go-autocomplete)
(require 'auto-complete-config)
