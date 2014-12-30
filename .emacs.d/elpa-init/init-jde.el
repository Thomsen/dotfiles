;; user-emacs-plugin
(add-to-list 'load-path (expand-file-name "plugins/jdee-2.4.1/lisp" user-emacs-directory))

(load "jde")
(add-to-list 'auto-mode-alist '("\\.java\\'" . jde-mode))

(provide 'init-jde)