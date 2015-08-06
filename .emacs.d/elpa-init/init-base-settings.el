;(require 'linum)
;(global-linum-mode t)

;; ctrl-space to meta-space
;(global-unset-key (kbd "C-SPC"))
;(global-set-key (kbd "M-SPC") 'set-mark-command)

;; 设置主题
;(load-theme ')

;; 设置自动备份
(setq
 backup-by-copying t
 backup-directory-alist
   '(("." . "~/.saves"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

;; 取消滚动栏
(set-scroll-bar-mode nil)

;; 取消工具栏
(tool-bar-mode 0)

;; 运行环境
(if window-system
  (progn 'in-window-system)
  'not-in-window-system)

;; for xterm
(xterm-mouse-mode 1)

;; 高亮当前行
(global-hl-line-mode 1)
(defface my-hl-line-face
  `((t (:background "white")))
  "Basic face for hl-line-mode"
  :group 'hl-line)
(setq my-hl-line-face-background-color
      (let ((color (or (x-color-values (face-attribute 'default :background))
		       (list 0 0 0)))
	    (R (lambda (i x) (abs (+ (nth i x) 8000)))))
	(format "#%04x%04x%04x"
		(funcall R 0 color)
		(funcall R 1 color)
		(funcall R 2 color))))
(set-face-attribute 'my-hl-line-face nil :background
		    my-hl-line-face-background-color)

;; 编码时自动换行
(global-set-key (kbd "RET") 'newline-and-indent)

;; space 替换 TAB
(setq-default indent-tabs-mode nil)

;; 设置自动换行的快捷键
(global-set-key [f12] 'toggle-truncate-lines)
(add-hook 'message-mode-hook
	  (lambda () (setq default-fill-column 80)
	    (turn-on-auto-fill)))

(setq pathname-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)


;; 设置字体大小
(setq cjk-font-size 20)
(setq ansi-font-size 20)

(defun set-font()
  (interactive)
  (create-fontset-from-fontset-spec
   (concat
    "-*-fixed-medium-r-normal-*-*-*-*-*-*-*-fontset-myfontset,"
    (format "ascii:-outline-YaHei Consolas Hybrid-normal-normal-normal-mono-%d-*-*-*-c-*-iso8859-1," ansi-font-size)
    (format "unicode:-microsoft-YaHei Consolas Hybrid-normal-normal-normal-*-%d-*-*-*-*-0-iso8859-1," cjk-font-size)
    (format "chinese-gb2312:-microsoft-YaHei Consolas Hybrid-normal-normal-normal-*-%d-*-*-*-*-0-iso8859-1," cjk-font-size)
    ;; (format "unicode:-outline-文泉驿等宽微米黑-normal-normal-normal-sans-*-*-*-*-p-*-gb2312.1980-0," cjk-font-size)
    ;; (format "chinese-gb2312:-outline-文泉驿等宽微米黑-normal-normal-normal-sans-*-*-*-*-p-*-gb2312.1980-0," cjk-font-size)
    )))

;; c-x c-= increase font size
(defun increase-font-size()
  "increase font size"
  (interactive)
  (if (< cjk-font-size 48)
      (progn
        (setq cjk-font-size (+ cjk-font-size 2))
        (setq ansi-font-size (+ ansi-font-size 2))))
  (message "cjk-size:%d pt, ansi-size:%d pt" cjk-font-size ansi-font-size)
  (set-font)
  (sit-for .5))

;; c-x c-- descrease font size
(defun decrease-font-size()
  "decrease font size"
  (interactive)
  (if (> cjk-font-size 2)
      (progn
        (setq cjk-font-size (- cjk-font-size 2))
        (setq ansi-font-size (- ansi-font-size 2))))
  (message "cjk-size:%d pt, ansi-size:%d pt" cjk-font-size ansi-font-size)
  (set-font)
  (sit-for .5))

(defun default-font-size()
  "default font size"
  (interactive)
  (setq cjk-font-size 16)
  (setq ansi-font-size 16)
  (message "cjk-size:%d pt, ansi-size:%d pt" cjk-font-size ansi-font-size)
  (set-font)
  (sit-for .5))

;; need delete desktop
(if window-system
    (progn
      (set-font)
      ;; 把上面的字体集设置成默认字体
      ;; 这个字体名使用是create-fontset-from-fontset-spec函数的第一行的最后两个字段
      (set-frame-font "fontset-myfontset")

      ;; 鼠标快捷键绑定
      (global-set-key '[C-wheel-up] 'increase-font-size)
      (global-set-key '[C-wheel-down] 'decrease-font-size)
      ;; 键盘快捷键绑定
      (global-set-key (kbd "C--") 'decrease-font-size) ;Ctrl+-
      (global-set-key (kbd "C-0") 'default-font-size) ;Ctrl+0
      (global-set-key (kbd "C-=") 'increase-font-size) ;Ctrl+=
      ))


;; 优先级，从后到前
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-16le-with-signature)
(prefer-coding-system 'utf-16)
(prefer-coding-system 'utf-8)

(defun start-newline-next ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun start-newline_prev ()
  (interactive)
  (forward-line -l)
  (start-newline-next))

(global-set-key (kbd "C-o") 'start-newline-next)
(global-set-key (kbd "M-o") 'start-newline_prev)

;; 支持ANSI color的shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;; 在shell的mode中启动多个shell buffer
(global-set-key (kbd "C-c z") 'shell)
(global-set-key (kbd "<f11>") 'rename-buffer)

;; undo刚刚离开的窗口,Ctrl-c <left>
(when (fboundp 'winner-mode)
  (winner-mode)
  (windmove-default-keybindings))

;; 设置只读打开文件
(defun make-some-files-read-only ()
  "when file opened is of a certain mode, make it read only"
  (when (memq major-mode '(c++-mode tcl-mode text-mode python-mode))
    (toggle-read-only 1)))
(add-hook 'find-file-hooks 'make-some-files-read-only)

;; todo mode
(setq todo-file-do "~/.emacs.d/todos/todo-do")
(setq todo-file-done "～/.emacs.d/todos/todo-done")
(setq todo-file-top "~/.emacs.d/todos/todo-top")

(provide 'init-base-settings)
