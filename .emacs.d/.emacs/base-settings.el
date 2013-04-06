;(require 'linum)
;(global-linum-mode t)

;; ctrl-space to meta-space
;(global-unset-key (kbd "C-SPC"))
;(global-set-key (kbd "M-SPC") 'set-mark-command)

;; 设置自动换行的快捷键
(global-set-key [f12] 'toggle-truncate-lines)
(add-hook 'message-mode-hook 
	  (lambda () (setq default-fill-column 80)
	    (turn-on-auto-fill)))

(set-language-environment 'UTF-8)
(setq-default pathname-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)

;; 优先级，从后到前
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-16le-with-signature)
(prefer-coding-system 'utf-16)
(prefer-coding-system 'utf-8)

(defun start-newline-next ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun start-newline_prev ()
  (interactive)
  (forward-line -l)
  (start-newline-next))

(global-set-key (kbd "C-o") 'start-newline-next)
(global-set-key (kbd "M-o") 'start-newline_prev)

(provide 'base-settings)