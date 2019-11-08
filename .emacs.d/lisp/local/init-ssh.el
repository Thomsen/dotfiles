;(require-package 'vagrant-tramp)

;; tramp for windows ssh remote file, but (wrong-type-argument arrayp nil)
;;(require 'vagrant-tramp)

(require 'tramp)
(set-default 'tramp-auto-save-directory "~\\Local\\Temp")
(set-default 'tramp-default-method "plink")

(provide 'init-ssh)
