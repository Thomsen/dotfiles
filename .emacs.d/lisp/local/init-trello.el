(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(require-package 'org-trello)

(require 'org-trello)

(custom-set-variables '(org-trello-files '("D:\\trello")))

(provide 'init-trello)