;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
	(with-current-buffer
		(url-retrieve-synchronously
		  "https://raw.github.com/dimitri/el-get/master/el-get-install.d")
	 (let (el-get-master-brance)
	   (goto-char (point-max))
	   (eval-print-last-sexp))))
(el-get 'sync)	

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "/opt/android/android-sdk-linux/") ;; android-mode sdk home
 '(rails-ws:default-server-type "webrick")
 '(truncate-partial-width-windows nil))  ;; word wrap

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)

;; manage .emacs configure file
(add-to-list 'load-path "~/.emacs.d/.emacs")
(require 'base-settings)
(require 'org-mode-settings)
(require 'ide-settings)
(put 'set-goal-column 'disabled nil)
