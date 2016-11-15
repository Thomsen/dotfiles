(maybe-require-package 'auctex-mode)

;; (require 'tex-mik)

(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

(add-hook 'LaTex-mode-hook 'visual-line-mode)
(add-hook 'LaTex-mode-hook 'flyspell-mode)
(add-hook 'LaTex-mode-hook 'LexTex-math-mode)

(add-hook 'LaTex-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq Tex-PDF-mode t)


(provide 'init-auctex)
