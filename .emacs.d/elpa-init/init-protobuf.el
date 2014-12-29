(require-package 'protobuf-mode)

(setq auto-model-alist (cons '("\\.proto$" . protobuf-mode) auto-mode-alist))
(autoload 'protobuf-mode "protobuf-mode" "edit google protobuf files use emacs")

(provide 'init-protobuf)
