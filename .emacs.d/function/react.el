;; //
;; // This document created by Julien JEAN
;; // For project : react set up
;; //
;; // Thu Jul 26 15:51:13 CEST 2018
;; // stuff
;; //

;;; code:

(defun insert-react-script (script)
	"Insert react SCRIPT."
	(interactive "p")
	(if (equal script 4)
		(insert "<script src=\"https://unpkg.com/react@16/umd/react.development.js\" crossorigin></script>
<script src=\"https://unpkg.com/react-dom@16/umd/react-dom.development.js\" crossorigin></script>")
		(insert "import React from \"react\";
import {} from \"react-native\";
import {} from \"native-base\";")))

(global-set-key (kbd "C-c C-r") 'insert-react-script)

;;; react.el ends here
