(require-package 'kotlin-mode)

(require 'kotlin-mode)

(add-to-list 'auto-mode-alist '("\\.kts\\'" . kotlin-mode) t)

(provide 'init-kotlin)
