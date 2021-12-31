(require-package 'rjsx-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(autoload 'rjsx-mode "rjsx-mode" "JSX mode" t)

(provide 'init-jsx)
