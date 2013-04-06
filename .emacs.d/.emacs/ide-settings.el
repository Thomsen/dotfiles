;; rvm
;(require 'rvm)
;(rvm-use-default)

;; rails
(setq load-path (cons (expand-file-name "~/.emacs.d/rails-reloaded") load-path))
(require 'rails-autoload)
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/rails-minor-mode"))
;(require 'rails)

;; slime
(setq inferior-lisp-program "/usr/bin/sbcl")

;; yasnippet
;(require 'yasnippet)
(yas/load-directory "~/.emacs.d/el-get/yasnippet/snippets") ; c lang auto framework

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)

;; cscope
(require 'xcscope)

(provide 'ide-settings)