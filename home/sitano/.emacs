; No toolbar and scrollbar
(scroll-bar-mode -1)
(tool-bar-mode -1)

; Setul tabs and indents
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)
(setq indent-line-function 'indent-relative)

; No backup files
(setq make-backup-files nil)

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

