(maybe-require-package 'yasnippet)

(require 'yasnippet)
(yas/global-mode 1)

;; set custom snippets
(setq snippets (expand-file-name "~/.emacs.d/snippets"))
(if (and (file-exists-p snippets) (not (member snippets yas-snippet-dirs)))
    (add-to-list 'yas-snippet-dirs snippets))

(provide 'init-yasnippet)
