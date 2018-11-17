;; //
;; // This document created by Julien JEAN
;; // For project : code related ruel
;; //
;; // Fri Aug 10 15:51:05 CEST 2018
;; // ruel
;; //

;;; code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;	DEV OPTION ONLY

(add-hook 'after-change-major-mode-hook
	(lambda ()
		(let (
				 (dev-list '(
								("C")
								("C/l")
								("CSS")
								("C++")
								("C++/l")
								("Lisp")
								("Emacs-Lisp")
								("Shell-script")
								("Makefile")
								("Java/l")
								("java")
								("PHP")
								("LaTeX")
								("JSX")
								("GNUmakefile")
								("HTML")
								))
				 (res nil))
			(setq res (assoc mode-name dev-list))
			(when (car res)
				(require 'whitespace)
				(require 'electric-operator)
				;; (setq company-idle-delay 0)
				;; (irony-mode t)
				(hs-minor-mode t)
				(global-set-key (kbd "M-RET") 'hs-toggle-hiding)
				(whitespace-toggle-options t)
				(ggtags-mode 1)
				(electric-operator-mode)
				(linum-mode t)
				))))

;;; code.el ends here
