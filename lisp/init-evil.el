;;; init-evil --- the configuration of evil

;;; Commentary:
;;; (c)Johnsonlee

;;; Code:
(use-package evil
  :init (evil-mode 1)
	(evil-set-undo-system 'undo-tree))
(use-package evil-leader)
(use-package evil-surround)
(use-package evil-nerd-commenter)
(use-package evil-visualstar)
(use-package evil-numbers)

;; edit tool
(use-package undo-tree
  :init (global-undo-tree-mode 1))

(provide 'init-evil)
;;; init-evil.el ends here
