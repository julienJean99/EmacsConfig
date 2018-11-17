
;;; code:

(defun my-header (project comment)
	"Creat a header for PROJECT using COMMENT."
	(interactive "sProject name : \nsComment : ")
	(save-excursion
		(goto-char (point-min))
		(insert "//")
		(newline)
		(insert "// This document created by Julien JEAN")
		(newline)
		(insert (format "// For project : %s" project))
		(newline)
		(insert "//")
		(newline)
		(insert (format "// %s" (shell-command-to-string "date")))
		(insert (format "// %s" comment))
		(newline)
		(insert "//")
		(newline 2)
		(comment-region (point-min) (point))))

(global-set-key (kbd "C-c h") 'my-header)

;;; my_header.el ends here
