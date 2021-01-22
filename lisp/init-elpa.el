;;; init-elpa.el --- settings for elpa

;;; Commentary:
;;; Code:
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(require 'package)
(unless (bound-and-true-p package--initialize)
  (package-initialize))
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)
(require 'use-package)

;; Evil
(use-package evil)
(use-package evil-leader)
(use-package evil-surround)
(use-package evil-nerd-commenter)
(use-package evil-visualstar)
(use-package evil-numbers)

;; edit tool
(use-package undo-tree
  :init (global-undo-tree-mode 1))

(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))

(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d%d"
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package ivy-posframe
  :init
  (setq ivy-posframe-display-function-alist
	'((swiper . ivy-posframe-display-at-frame-center)
	  (complete-symbol . ivy-posframe-display-at-point)
	  (counsel-M-x . ivy-posframe-display-at-frame-center)
	  (counsel-find-file . ivy-posframe-display-at-frame-center)
	  (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
	  (t . ivy-posframe-display-at-frame-center))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after (ivy)
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  ;; TODO: replace the searching keybinding with vim's.
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

;; comfort tool
(use-package restart-emacs)
(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))
(use-package which-key
  :defer nil
  :config (which-key-mode))
;; nice skirts
(use-package atom-one-dark-theme)
(use-package dracula-theme)
(use-package gruvbox-theme)
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))

;; performance benchmark
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;; language tool
(use-package company
  :hook ((after-init . global-company-mode)))
(use-package flycheck
  :hook (after-init . global-flycheck-mode))
(provide 'init-elpa)
;;; init-elpa.el ends here
