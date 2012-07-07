(require 'python-mode)
(add-hook 'python-mode-hook 'my-py-mode)
(defun my-py-mode()
  (interactive)
  ;; (define-key python-mode-map (kbd "<return>") 'newline-and-indent)
  ;; (define-key python-mode-map (kbd "C-m") 'newline-and-indent)
  ;; (define-key python-mode-map (kbd "M-j") 'windmove-down)
  (setq indent-tabs-mode nil)
  (which-function-mode t)
  (font-lock-add-keywords
   nil
   '(
     ;; Calling functions
     ("\\<\\([_a-zA-Z]\\sw*\\)[[:space:]]*(" 1 font-lock-function-call-face)
     ;; Invalid number
     ("\\(?:\\b[_a-zA-Z]\\w*\\|\\]\\|)\\)[[:space:]]*\\.[[:space:]]*\\([0-9]\\sw*\\)\\b"
      1 font-lock-warning-face)
     ("\\<\\([0-9]\\sw*\\)[[:space:]]*("
      1 font-lock-warning-face)
     ;; Valid hex number (will highlight invalid suffix though)
     ("\\b0x[0-9a-f]+\\b" . font-lock-string-face)
     ;; Invalid hex number
     ("\\b0x\\(\\w\\|\\.\\)+\\b" . font-lock-warning-face)
     ;; Valid floating point number.
     ("\\b[0-9]*\\([0-9]\\.\\|\\.[0-9]\\)[0-9]*\\([eE][-]?[0-9]+\\)?\\b"
      . font-lock-string-face)
     ("\\b\\([0-9]+\\(\\.\\)?[0-9]*\\|\\.[0-9]+\\)[eE][-]?[0-9]+\\b"
      . font-lock-string-face)

     ;; Invalid floating point number.  Must be before valid decimal.
     ;; ("\\b[0-9].*?\\..+?\\b" . font-lock-warning-face)

     ;; Valid decimal number.  Must be before octal regexes otherwise 0
     ;; will be highlighted as errors.  Will highlight invalid suffix though.
     ("\\b\\(0\\|[1-9][0-9]*\\)\\b" (1 font-lock-string-face))

     ;; Valid octal number
     ("\\b0o[0-7]+\\b" . font-lock-string-face)

     ;; Floating point number with no digits after the period.  This must be
     ;; after the invalid numbers, otherwise it will "steal" some invalid
     ;; numbers and highlight them as valid.
     ("\\b\\([0-9]+\\)\\." (1 font-lock-string-face))

     ;; Invalid number.  Must be last so it only highlights anything not
     ;; matched above.
     ("\\b[0-9]\\(\\w\\|\\.\\)+?\\b" . font-lock-warning-face)
     ) t)
  )
(require 'xcscope)
