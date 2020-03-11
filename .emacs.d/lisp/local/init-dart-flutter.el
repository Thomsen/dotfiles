(require-package 'dart-mode)

(require-package 'flutter)
(require-package 'flutter-l10n-flycheck)

;; Assuming usage with dart-mode
(require 'dart-mode)

(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))

(setq dart-form-on-save t)
(setq dart-sdk-path "/d/Local/flutter_v1.9.1/bin/cache/dart-sdk")

(require 'flutter)

(setq flutter-sdk-path "/d/Local/flutter_v1.9.1")

;; Optional
(require 'flutter-l10n-flycheck)


(provide 'init-dart-flutter)
