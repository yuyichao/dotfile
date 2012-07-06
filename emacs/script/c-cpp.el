(require 'cc-mode)
(add-hook 'c-mode-hook 'my-c-mode)
(add-hook 'c++-mode-hook 'my-c-mode)
(defun my-c-mode()
  (interactive)
  (define-key c-mode-map (kbd "<return>") 'newline-and-indent)
  (define-key c++-mode-map (kbd "<return>") 'newline-and-indent)
  (define-key c-mode-map (kbd "C-m") 'newline-and-indent)
  (define-key c++-mode-map (kbd "C-m") 'newline-and-indent)
  ;; (define-key c-mode-map (kbd "C-?") 'c-hungry-delete-backwards)
  ;; (define-key c++-mode-map (kbd "C-?") 'c-hungry-delete-backwards)
  ;; (define-key c-mode-map (kbd "<backspace>") 'c-hungry-delete-backwards)
  ;; (define-key c++-mode-map (kbd "<backspace>") 'c-hungry-delete-backwards)
  (define-key c-mode-map (kbd "M-j") 'windmove-down)
  (define-key c++-mode-map (kbd "M-j") 'windmove-down)
  (setq indent-tabs-mode nil)
  (c-set-style "K&R")
  (c-toggle-hungry-state t)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode t)
  (font-lock-add-keywords
   nil
   '(
     ("\\<\\([_0-9A-Z]+\\)[[:space:]]*(" 1 font-lock-macro-call-face)
     ("\\<\\(\\sw+\\)[[:space:]]*(" 1 font-lock-function-call-face)
     ;; Valid hex number (will highlight invalid suffix though)
     ("\\b0x[[:xdigit:]]+[uUlL]*\\b" . font-lock-string-face)
     ;; Invalid hex number
     ("\\b0x\\(\\w\\|\\.\\)+\\b" . font-lock-warning-face)
     ;; Valid floating point number.
     ("\\(\\b[0-9]+\\|\\)\\(\\.\\)\\([0-9]+\\(e[-]?[0-9]+\\)?\\([lL]?\\|[dD]?[fF]?\\)\\)\\b"
      (1 font-lock-string-face) (3 font-lock-string-face))

     ;; Invalid floating point number.  Must be before valid decimal.
     ("\\b[0-9].*?\\..+?\\b" . font-lock-warning-face)

     ;; Valid decimal number.  Must be before octal regexes otherwise 0 and 0l
     ;; will be highlighted as errors.  Will highlight invalid suffix though.
     ("\\b\\(\\(0\\|[1-9][0-9]*\\)[uUlL]*\\)\\b" 1 font-lock-string-face)

     ;; Valid octal number
     ("\\b0[0-7]+[uUlL]*\\b" . font-lock-string-face)

     ;; Floating point number with no digits after the period.  This must be
     ;; after the invalid numbers, otherwise it will "steal" some invalid
     ;; numbers and highlight them as valid.
     ("\\b\\([0-9]+\\)\\." (1 font-lock-string-face))

     ;; Invalid number.  Must be last so it only highlights anything not
     ;; matched above.
     ("\\b[0-9]\\(\\w\\|\\.\\)+?\\b" . font-lock-warning-face)
     ("\\b\\([_0-9A-Z]+\\)\\b" 1 font-lock-macro-face)
     ("\\(?:->\\|\\.\\)[[:space:]]*\\(\\sw+\\)\\b" 1 font-lock-member-face)
     ) t)
  )
(require 'xcscope)
