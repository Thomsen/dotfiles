(require-package 'emmet-mode)

;; Auto-start on any markup modes 
(add-hook 'sgml-mode-hook 'emmet-mode)

;; enable Emmet's css abbreviation
(add-hook 'css-mode-hook 'emmet-mode)

;; C-j expand

(define-key global-map "\C-j" 'emmet-expand-line) ; linefeed

(provide 'init-emmet)
