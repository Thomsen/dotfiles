(require-package 'zencoding-mode)

(setq auto-mode-alist
      (cons '("\\.\\(html$\\|css$\\|erb$\\)\\'" . zencoding-mode) auto-mode-alist))

;; C-j expand

(provide 'init-zencoding)
