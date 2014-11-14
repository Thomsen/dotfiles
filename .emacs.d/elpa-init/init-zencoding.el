(require-package 'zencoding-mode)

;; Auto-start on any markup modes 
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; C-j expand

(define-key global-map "\C-j" 'zencoding-expand-line) ; linefeed

(provide 'init-zencoding)
