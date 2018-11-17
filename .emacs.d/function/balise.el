;; //
;; // This document created by Julien JEAN
;; // For project : balise for jsx
;; //
;; // Tue Aug 14 16:24:43 CEST 2018
;; // balise
;; //

;;; code:

(defun auto-closing-balise (word)
	"Create an auto closing balise using WORD."
	(insert (format "<%s />" word))
	(backward-char 2)
	)

(defun balise (word)
	"Create a balise using WORD."
	(insert (format "<%s></%s>" word word))
	(backward-word)
	(backward-char 2)
	)

(defun create-balise (mode)
	"Creat a balise on the current word.
MODE for auto closeing."
	(interactive "p")
	(let ((word (word-at-point)))
		(backward-word)
		(word-search-forward word nil t)
		(replace-match "")
		(if (equal mode 4)
			(auto-closing-balise word)
			(balise word))
		))

(global-set-key (kbd "C-c C-b") 'create-balise)

;;; balise.el ends here
