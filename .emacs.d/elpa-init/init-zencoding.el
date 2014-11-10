(require-package 'zencoding-mode)

;; Auto-start on any markup modes 
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; C-j expand

(provide 'init-zencoding)
