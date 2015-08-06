;; user-plugins-directory
(setq user-plugins-directory (expand-file-name "plugins" user-emacs-directory))


;; gradle plugin
(add-to-list 'load-path (expand-file-name "gradle" user-plugins-directory))
(require 'gradle)

;; jdee plugin
(add-to-list 'load-path (expand-file-name "jdee-2.4.2/lisp" user-plugins-directory))
(load "jde-autoload")
