(require-package 'smart-tab)

(require 'smart-tab)
(global-smart-tab-mode 1)

;; (define-key read-expression-map [(tab)] 'hippie-expand)

;; (defun hippie-unexpand ()
;;   (interactive)
;;   (hippie-expand ()))

;; (define-key read-expression-map [(shift tab )] 'hippie-unexpand)

;; (setq-local left-margin 4)
;; (setq indent-line-function 'insert-tab)

;; (setq tab-stop-list (number-sequence 4 120 4)) ;; M-i
;; (setq-default tab-width 4) ;; effect soft tab char，not hard tab key

;; (setq-default c-basic-offset 4)
(setq-default js2-basic-offset 2)  ;; effect javascript 4 space indent

;; (setq c-tab-always-indent t)

;; (global-set-key (kbd "TAB") 'self-insert-command)

;; replace tab by space
(setq-default indent-tabs-mode nil) ;; default t, nil use space

;; (add-hook 'text-mode-hook
;;           (lambda () (setq indent-tabs-mode t)))

;; coding auto new line
(global-set-key (kbd "RET") 'newline-and-indent)

;; auto new line keyboard
(global-set-key [f12] 'toggle-truncate-lines)
(add-hook 'message-mode-hook
          (lambda () (setq-default fill-column 120)
            (turn-on-auto-fill)))



(provide 'init-indent)
