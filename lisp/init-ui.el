;; apperance
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(setq initial-frame-alist '((fullscreen . maximized)))
(load-theme 'gruvbox-dark-soft t)
(provide 'init-ui)
