(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-startup)
(require 'init-elpa)
(require 'init-kbd)
(require 'init-evil)
(require 'init-ui)
(require 'init-lsp)
(require 'init-go)
(require 'init-org)

(when (file-exists-p custom-file)
	(load-file custom-file))
