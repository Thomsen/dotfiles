;; org-mode 7.9.3
;(add-to-list 'load-path "~/.emacs.d/org-8.0.7/lisp")

(setq org-version "7.9.3")
(if (string-lessp org-version "8.0.0") ; string-lessp alias string<
  (progn
    (require 'org-latex)
    (require 'org-publish))
  (progn
    (require 'ox-latex) ; default article,report,book,beamer
    (require 'ox-publish)))

(require 'org-loaddefs)
;(add-hook 'ord-mode-hook
;	  (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook 
	  (lambda () (setq toggle-truncate-lines nil)))

;; tab confict (yasnippet)
;(defun yas/org-very-safe-expand ()
;  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))
;
;(defun yas/org-very-safe-expand ()
;  (let ((yas-fallback-behavior 'return-nil))
;    (and (fboundp 'yas-expand) (yas-expand))))

;(add-hook 'org-mode-hook
;	  (lambda ()
;	    (make-variable-buffer-local 'yas/trigger-key)
;	    (setq yas/trigger-key [tab])
;	    (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
;	    (define-key yas/keymap [c+tab] 'yas/next-field)
;	    ))


; xelatex to pdf
(
 setq org-latex-to-pdf-process ; before 8.0
 ;setq org-latex-pdf-process   ; after 8.0
      '("xelatex -interaction nonstopmode %f"
        "xelatex -interaction nonstopmode %f"))

;(setq org-confirm-babel-evaluate nil)

;; Auctex require (menu latex else tex)
;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)
;(setq TeX-auto-save t)
;(setq TeX-parse-self t)
;(setq-default TeX-master nil)

;(defun org-mode-article-modes ()
;  (reftex-mode t)
;  (and (buffer-file-name)
;       (file-exists-p (buffer-file-name))
;       (reftex-parse-all)))
;(add-hook 'org-mode-hook
;	  (lambda ()
;	    (if (member "REFTEX" org-todo-keywords-1)
;		(org-mode-article-modes))))
;(unless (boundp 'org-latex-export-latex-classes)
;  (setq org-export-latex-classes nil))
;
;(setq org-export-latex-listings t) 




(
 ;add-to-list 'org-latex-classes ; after 8.0
 add-to-list 'org-export-latex-classes ; before 8.0
	     '("cn-article"
              "\\documentclass[10pt, a4paper]{article}
               \\usepackage{graphicx}
               \\usepackage{xcolor}
               \\usepackage{xeCJK}
               \\usepackage{lmodern}
               \\usepackage{verbatim}
               \\usepackage{fixltx2e}
               \\usepackage{longtable}
               \\usepackage{float}
               \\usepackage{tikz}
               \\usepackage{wrapfig}
               \\usepackage{soul}
               \\usepackage{textcomp}
               \\usepackage{listings}
               \\usepackage{geometry}
               \\usepackage{algorithm}
               \\usepackage{algorithmic}
               \\usepackage{marvosym}
               \\usepackage{wasysym}
               \\usepackage{latexsym}
               \\usepackage{natbib}
               \\usepackage{fancyhdr}
               \\usepackage[xetex,colorlinks=true,CJKbookmarks=true,linkcolor=blue,urlcolor=blue,menucolor=blue]{hyperref}
               \\usepackage{fontspec,xunicode,xltxtra}
               \\setmainfont[BlodFont=DejaVu Sans Mono]{WenQuanYi Zen Hei}
               \\setsansfont[BlodFont=DejaVu Sans Mono]{AR PL UKai CN}
               \\setmonofont{Bitstream Vera Sans Mono}  
               \\newcommand\\fontnamemono{AR PL UKai CN}%等宽字体
               \\newfontinstance\\MONO{\\fontnamemono}
               \\newcommand{\\mono}[1]{{\\MONO #1}}
               \\setCJKmainfont[Scale=0.9]{WenQuanYi Zen Hei}%中文字体
               \\setCJKmonofont[Scale=0.9]{WenQuanYi Zen Hei Mono}
               \\hypersetup{unicode=true}
               \\geometry{a4paper, textwidth=6.5in, textheight=10in,marginparsep=7pt, marginparwidth=.6in}
               \\definecolor{foreground}{RGB}{220,220,204}%浅灰
               \\definecolor{background}{RGB}{62,62,62}%浅黑
               \\definecolor{preprocess}{RGB}{250,187,249}%浅紫
               \\definecolor{var}{RGB}{239,224,174}%浅肉色
               \\definecolor{string}{RGB}{154,150,230}%浅紫色
               \\definecolor{type}{RGB}{225,225,116}%浅黄
               \\definecolor{function}{RGB}{140,206,211}%浅天蓝
               \\definecolor{keyword}{RGB}{239,224,174}%浅肉色
               \\definecolor{comment}{RGB}{180,98,4}%深褐色
               \\definecolor{doc}{RGB}{175,215,175}%浅铅绿
               \\definecolor{comdil}{RGB}{111,128,111}%深灰
               \\definecolor{constant}{RGB}{220,162,170}%粉红
               \\definecolor{buildin}{RGB}{127,159,127}%深铅绿
               \\punctstyle{kaiming}
               \\title{}
               \\fancyfoot[C]{\\bfseries\\thepage}
               \\chead{\\MakeUppercase\\sectionmark}
               \\pagestyle{fancy}
               \\tolerance=1000
               [NO-DEFAULT-PACKAGES]
               [NO-PACKAGES]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;(add-to-list 'org-export-latex-classes
;             ;; beamer class, for presentations
;             '("beamer"
;               "\\documentclass[11pt,professionalfonts]{beamer}
;\\mode
;\\usetheme{{{{Warsaw}}}}
;%\\usecolortheme{{{{beamercolortheme}}}}
;\\beamertemplateballitem
;\\setbeameroption{show notes}
;\\usepackage{graphicx}
;\\usepackage{tikz}
;\\usepackage{xcolor}
;\\usepackage{xeCJK}
;\\usepackage{amsmath}
;\\usepackage{lmodern}
;\\usepackage{fontspec,xunicode,xltxtra}
;\\usepackage{polyglossia}
;\\setmainfont{Times New Roman}
;\\setCJKmainfont{DejaVu Sans YuanTi}
;\\setCJKmonofont{DejaVu Sans YuanTi Mono}
;\\usepackage{verbatim}
;\\usepackage{listings}
;\\institute{{{{beamerinstitute}}}}
;\\subject{{{{beamersubject}}}}"
;               ("\\section{%s}" . "\\section*{%s}")
;               ("\\begin{frame}[fragile]\\frametitle{%s}"
;                "\\end{frame}"
;                "\\begin{frame}[fragile]\\frametitle{%s}"
;                "\\end{frame}")))
;
;(setq org-export-latex-default-packages-alist nil 
;     org-export-latex-packages-alist nil)

(setq org-export-latex-listings t)
;(add-to-list 'org-export-latex-packages-alist
;	     '(("AUTO" "inputenc" t)))

;(add-to-list 'org-export-latex-classes
;	(list "cn-article"
;	(concat "\\documentclass[10pt,a4paper]{article}")))
;
;(add-to-list 'org-export-latex-packages-alist
;	'("" "listings"))
;(add-to-list 'org-export-latex-packages-alist
;	'("" "color"))
;(add-to-list 'org-export-latex-packages-alist
;	'("" "minted"))
;

(setq org-export-backends
      (quote (
	      ascii
	      beamer  		; latex beamer format
	      md		; markdown
	      html
	      man		; man page format
	      odt
	      texinfo
	      taskjuggler)))

;; org-mode dropbox
(setq org-publish-project-alist
      '(
	("blog-notes"
	 :base-directory "~/Dropbox/org-note/"
	 :base-extension "org"
	 :publishing-directory "~/Dropbox/Apps/Pancake.io/"
	 :recursive t
	 ;:publishing-function org-html-publish-to-html ;; after 8
         ;:html-link-home "index.html"
	 ;:html-link-up "sitemap.html"
         :publishing-function org-publish-org-to-html ;; before 8
	 :link-home "index.html"
         :link-up "sitemap.html"
	 :headline-levels 5
	 :section-numbers nil
	 :auto-preamble t
	 :auto-sitemap t
	 :sitemap-filename "sitemap.org"
	 ;:sitemap-title "Sitemap"
	 :author "Thomsen"
	 :email "androidfoross@gmail.com"
	 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\" />"
	 :html-preamble "Anyuaning Blog"
	 :html-postamble "<p class=\"author\">Author: %a(%e)</p>Last Updated %d . Created by %c </p>"
	 )
	("blog-static"
	  :base-directory "~/Dropbox/org-note/"
	  :base-extension "css\\|js\\|pdf\\|png\\|jpg\\|gif\\|map3\\|ogg\\|swf"
	  :publishing-directory "~/Dropbox/Apps/Pancake.io/"
	  :recursive t
	  :publiching-function org-publish-attachment
	  )
	("blog" :components ("blog-notes" "blog-static"))

	)
)

(provide 'init-org-export)
