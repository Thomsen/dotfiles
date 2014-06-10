;; user-plugins-directory
(setq user-plugins-directory (expand-file-name "plugins" user-emacs-directory))


;; gradle plugin
(add-to-list 'load-path (expand-file-name "gradle" user-plugins-directory))
(require 'gradle)

