;; user-emacs-plugin
(add-to-list 'load-path (expand-file-name "plugins/jdee-2.4.2/lisp" user-emacs-directory))

(load "jde-autoload")
(add-to-list 'auto-mode-alist '("\\.java\\'" . jde-mode))

(provide 'init-jde)
