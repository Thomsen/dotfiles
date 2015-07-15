(maybe-require-package 'yasnippet)

;; set custom snippets
(setq snippets (expand-file-name "~/.emacs.d/snippets"))
;(if (and (file-exists-p snippets) (not (member snippets yas-snippet-dirs)))
;  (add-to-list 'yas-snippet-dirs snippets))

(require 'yasnippet)
(yas/global-mode 1)


(provide 'init-yasnippet)
