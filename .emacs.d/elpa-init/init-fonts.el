(cond
 ((string-equal system-type "gnu/linux") ; linux
  (when (member "Source Code Pro" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "Source Code Pro-11"))
    (add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))
    ;(set-frame-font "Source Code Pro-11")
    (setq window-system-default-frame-alist
          '((x
             (menu-bar-lines . 1)
             (tool-bar-lines . nil)
             (mouse-wheel-mode . 1)
             (mouse-wheel-follow-mouse . t)
             (mouse-avoidance-mode . 'exile)
             (font . "Source Code Pro 20"))
            (nil
             (menu-bar-lines . 0)
             (tool-bar-lines . 0))
            )))
  )
)

(require 'cl)

(defun sanityinc/font-name-replace-size (font-name new-size)
  (let ((parts (split-string font-name "-")))
    (setcar (nthcdr 7 parts) (format "%d" new-size))
    (mapconcat 'identity parts "-")))

(defun sanityinc/increment-default-font-height (delta)
  "Adjust the default font height by DELTA on every frame.
Emacs will keep the pixel size of the frame approximately the
same.  DELTA should be a multiple of 10, to match the units used
by the :height face attribute."
  (let* ((new-height (+ (face-attribute 'default :height) delta))
         (new-point-height (/ new-height 10)))
    (dolist (f (frame-list))
      (with-selected-frame f
        ;; Latest 'set-frame-font supports a "frames" arg, but
        ;; we cater to Emacs 23 by looping instead.
        (set-frame-font (sanityinc/font-name-replace-size
                         (face-font 'default)
                         new-point-height)
                        t)))
    (set-face-attribute 'default nil :height new-height)
    (message "default font size is now %d" new-point-height)))

(defun sanityinc/increase-default-font-height ()
  (interactive)
  (sanityinc/increment-default-font-height 10))

(defun sanityinc/decrease-default-font-height ()
  (interactive)
  (sanityinc/increment-default-font-height -10))

(global-set-key (kbd "C-M-=") 'sanityinc/increase-default-font-height)
(global-set-key (kbd "C-M--") 'sanityinc/decrease-default-font-height)



(provide 'init-fonts)
