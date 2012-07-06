(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(require 'font-lock)
(defface font-lock-function-call-face
  '((t (:foreground "DarkGreen" :weight bold)))
  "Font Lock mode face used to highlight function calls."
  :group 'font-lock-highlighting-faces)
(defface font-lock-macro-call-face
  '((t (:foreground "DarkViolet" :weight bold)))
  "Font Lock mode face used to highlight macro calls."
  :group 'font-lock-highlighting-faces)
(defface font-lock-macro-face
  '((t (:foreground "DarkBlue")))
  "Font Lock mode face used to highlight macro calls."
  :group 'font-lock-highlighting-faces)
(defface font-lock-member-face
  '((t (:foreground "chocolate")))
  "Font Lock mode face used to highlight macro calls."
  :group 'font-lock-highlighting-faces)
(defvar font-lock-function-call-face 'font-lock-function-call-face)
(defvar font-lock-macro-call-face 'font-lock-macro-call-face)
(defvar font-lock-macro-face 'font-lock-macro-face)
(defvar font-lock-member-face 'font-lock-member-face)
