
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)

;; ----------------------------------
;;           EPITECH CONFIG
;; ----------------------------------
(add-to-list 'load-path "~/.emacs.d/lisp/")
;;(load "std.el")
(load "std_comment.el")
'(package-selected-packages
	(quote
		()))

(add-to-list 'package-archives
	'("melpa" . "http://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
	'(flycheck-clang-include-path
		 (quote
			 ("./include" "../include" "../../include" "../../../include" "../../../../include")))
 '(global-flycheck-mode t)
 '(helm-etags-tag-file-name ".TAGS")
 '(inhibit-startup-screen t)
 '(lisp-body-indent 4)
 '(lisp-indent-offset 4)
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(neo-auto-indent-point t)
 '(org-edit-src-content-indentation 4)
 '(org-html-indent t)
 '(org-latex-minted-options (quote (("bgcolor" "codeBg") ("frame" "bottomline"))))
 '(org-latex-remove-logfiles t)
 '(org-src-preserve-indentation t)
	'(package-selected-packages
		 (quote
			 (sx flycheck-status-emoji flycheck-gradle flycheck-popup-tip company-irony-c-headers company-c-headers company-irony company flycheck-irony web-mode zone-nyan nyan-mode org-ac ac-math exec-path-from-shell ace-mc exwm org-bullets flycheck-css-colorguard ac-html ac-html-angular magit flex-autopair ggtags electric-operator flycheck auto-complete neotree centered-cursor-mode ample-theme helm)))
 '(select-enable-clipboard t)
 '(send-mail-function (quote mailclient-send-it))
 '(sgml-basic-offset 4)
 '(show-paren-mode t)
 '(sx-default-site "stackoverflow")
 '(x-select-enable-clipboard-manager t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(eval-after-load 'flycheck
	'(add-hook 'flycheck-mode-hook #'flycheck-css-colorguard-setup ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	HELM
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	MAGIT
(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	COMPANY


;; (require 'irony)
;; (require 'company)
;; ;; (eval-after-load 'company
;; ;; 	(add-to-list 'company-backends 'company-irony))
;;
;; ;; (defun <company-my-backend (command &optional arg &rest ignored)
;; ;;	(pcase command
;; ;;		(`prefix (company-grab-symbol))
;; ;;		(`candidates (list "foobar" "foobaz" "foobarbaz"))
;; ;;		(`meta (format "This value is named %s" arg))))

;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)

;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; (defun my-irony-mode-hook ()
;; 	"my irony hook"
;; 	(define-key irony-mode-map [remap completion-at-point]
;; 		'irony-completion-at-point-async)
;; 	(define-key irony-mode-map [remap complete-symbol]
;; 		'irony-completion-at-point-async)
;; 	(setq-default irony-cdb-compilation-databases '(irony-cdb-clang-complete
;; 		                                            irony-cdb-libclang)))

;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	MY FUNCTION
(add-to-list 'load-path "~/.emacs.d/function/")

(load "my_header.el")
(load "react.el")
(load "code.el")
(load "balise.el")

(defun terminal ()
	"Open a terminal in an other buffer."
	(interactive)
	(split-window-right)
	(other-window 1)
	(term "/bin/bash")
	(other-window -1))

(global-set-key (kbd "C-x t") 'terminal)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	STACK OVERFLOW

(define-prefix-command 'launcher-map)
(global-set-key (kbd "C-c s") 'launcher-map)
(define-key launcher-map "q" #'sx-tab-all-questions)
(define-key launcher-map "i" #'sx-inbox)
(define-key launcher-map "o" #'sx-open-link)
(define-key launcher-map "u" #'sx-tab-unanswered-my-tags)
(define-key launcher-map "a" #'sx-ask)
(define-key launcher-map "s" #'sx-search)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'neotree)
(defun neotree-startup ()
	"Enable neotree."
	(neotree-show)
	(call-interactively 'other-window))
(neotree-startup)

(load-theme 'ample t)
(xterm-mouse-mode t)
(require 'centered-cursor-mode)
(global-centered-cursor-mode t)
(flex-autopair-mode 1)
(ac-config-default)


(require 'ace-mc)
(global-set-key (kbd "C-c C-SPC") 'ace-mc-add-multiple-cursors)
(global-set-key (kbd "C-c m") 'ace-jump-mode)

(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "C-M-<next>") 'windmove-right)
(global-set-key (kbd "C-M-<prior>") 'windmove-left)

;; (require 'electric-operator)
;; (add-hook 'c-mode-common-hook #'electric-operator-mode)
;; (add-hook 'python-mode-common-hook #'electric-operator-mode)
;; (add-hook 'c++-mode-hook #'electric-operator-mode)
;; (add-hook 'css-mode-hook #'electric-operator-mode)
;; (add-hook 'js-mode-hook #'electric-operator-mode)

(setq default-abbrev-mode t)

(let ((width 4))
	(setq indent-tabs-mode t
		default-tab-width width
		c-basic-offset width
		lisp-indent-offset width
		)
	(add-hook 'html-mode-hook
		(lambda ()
			(modify-syntax-entry ?< "w" (syntax-table))
			(set 'sgml-indent-line width))))

(defun xah-syntax-color-hex ()
"Syntax color text of the form 「#ff1100」 and 「#abc」 in current buffer.
URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
Version 2017-03-12"
	(interactive)
	(font-lock-add-keywords
		nil
		'(("#[[:xdigit:]]\\{3\\}"
			(0 (put-text-property
				(match-beginning 0)
				(match-end 0)
				'face (list :background
						(let* (
								(ms (match-string-no-properties 0))
								(r (substring ms 1 2))
								(g (substring ms 2 3))
								(b (substring ms 3 4)))
							(concat "#" r r g g b b))))))
			("#[[:xdigit:]]\\{6\\}"
				(0 (put-text-property
					(match-beginning 0)
					(match-end 0)
					'face (list :background (match-string-no-properties 0)))))))
	(font-lock-flush))

(add-hook 'css-mode-hook
	(lambda ()
		(xah-syntax-color-hex)))

(add-hook 'before-save-hook
	(lambda ()
		(delete-trailing-whitespace)))

(add-hook 'org-mode-hook
	(lambda ()
		(org-bullets-mode)))


(add-hook 'flycheck-mode-hook
		 '(lambda ()
			 (flycheck-popup-tip-mode)
			 (flycheck-gradle-setup)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js-jsx-mode))

(require 'org-ac)

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "org-ac")

(org-ac/config-default)
(setq TeX-auto-untabify 't)

(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
	'("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
		 "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
		 "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-src-preserve-indentation t)

(put 'scroll-lef 'disabled nil)

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)

;;; .emacs ends here
