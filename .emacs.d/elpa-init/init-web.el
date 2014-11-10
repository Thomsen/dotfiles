(require-package 'web-mode)

(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))

(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))  ; no effect (html-erb-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gohtml\\'" . web-mode))

;; associate en eigine setq -> defvar
;(defvar web-mode-engines-alist
;  '(("erb" . "\\.erb\\'")
;    ))

(defun use-web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 2)
  )
(add-hook 'web-mode-hook 'use-web-mode-hook)

;; snippet
(setq web-mode-extra-snippets
      '(("erb" . (("name" . ("beg" . "end"))))
        ("php" . (("name" . ("beg" . "end"))
                  ("name" . ("beg" . "end"))))
       ))

;; auto-pair
(setq web-mode-extra-auto-pairs
      '(("erb" . (("open" "close")))
        ("php" . (("open" "close")
                  ("open" "close")))
      ))
(setq web-mode-enable-auto-pairing t)

(provide 'init-web)
