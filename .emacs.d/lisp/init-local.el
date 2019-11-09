;; user-plugins-directory
(setq user-plugins-directory (expand-file-name "../plugins" user-emacs-directory))

;; local plugins
(setq plugins-el (expand-file-name "../plugins.el" user-emacs-directory))
(when (file-exists-p plugins-el)
  (load plugins-el))

(add-to-list 'load-path (expand-file-name "lisp/local" user-emacs-directory))

;;-------------------------------------------------------------------------
;; require plugin
;;------------------------------------------------------------------------

(require 'init-auctex)
(require 'init-auto-complete)
(require 'init-clang)
(require 'init-compat)
(require 'init-cscope)
(require 'init-editorconfig)
(require 'init-emmet)
(require 'init-ess)
(require 'init-flyspell)
(require 'init-fonts)
;;(require 'init-growl)
;;(require 'init-ido)
(require 'init-indent)
(require 'init-jsx)
(require 'init-jupyter)
(require 'init-kotlin)
;;(require 'init-maxframe)
(require 'init-nodejs-repl)
(require 'init-org-export)
(require 'init-protobuf)
(require 'init-proxies)
(require 'init-python-mode)
(require 'init-ruby-extra)
(require 'init-ruby-mode)
(require 'init-ssh)
(require 'init-thrift)
(require 'init-trello)
(require 'init-typescript)
(require 'init-web)
(require 'init-yasnippet)


;;-----------------------------------------------------------------------------
;; manage configure file
;;-----------------------------------------------------------------------------
(require 'init-base-settings)
(require 'init-other-settings)


(provide 'init-local)
