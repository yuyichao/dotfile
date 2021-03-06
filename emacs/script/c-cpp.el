;; (autoload 'c-mode "cc-mode.el" "C mode." t)
;; (autoload 'c++-mode "cc-mode.el" "C++ mode." t)
(add-to-list 'auto-mode-alist '("\\.cl$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))

(defun load-cc-hook()
  (add-hook 'c-mode-hook 'my-c-mode)
  (add-hook 'c++-mode-hook 'my-c-mode)
  )

(setq c-macro-names-with-semicolon
      '("Q_OBJECT" "Q_PROPERTY" "Q_DECLARE" "Q_ENUMS" "Q_CLASSINFO"
        "Q_PLUGIN_METADATA"))
(eval-after-load "cc-mode" '(load-cc-hook))

(defun my-set-c-mode-map()
  ;; (define-key c-mode-map (kbd "<return>") 'newline-and-indent)
  ;; (define-key c++-mode-map (kbd "<return>") 'newline-and-indent)
  ;; (define-key c-mode-map (kbd "C-m") 'newline-and-indent)
  ;; (define-key c++-mode-map (kbd "C-m") 'newline-and-indent)
  ;; (define-key c-mode-map (kbd "C-?") 'c-hungry-delete-backwards)
  ;; (define-key c++-mode-map (kbd "C-?") 'c-hungry-delete-backwards)
  ;; (define-key c-mode-map (kbd "<backspace>") 'c-hungry-delete-backwards)
  ;; (define-key c++-mode-map (kbd "<backspace>") 'c-hungry-delete-backwards)
  (define-key c-mode-map (kbd "M-j") 'windmove-down)
  (define-key c++-mode-map (kbd "M-j") 'windmove-down)
  (define-key c-mode-map (kbd "C-c C-w") 'delete-region)
  (define-key c++-mode-map (kbd "C-c C-w") 'delete-region)
  (define-key c-mode-map (kbd "C-c C-k") 'uncomment-region)
  (define-key c++-mode-map (kbd "C-c C-k") 'uncomment-region)
  (define-key c-mode-map (kbd "C-c C-c") 'c-toggle-comment-style)
  (define-key c++-mode-map (kbd "C-c C-c") 'c-toggle-comment-style)
  )

(defun my-set-c-style()
  (setq indent-tabs-mode nil)
  (c-set-style "K&R")
  (c-toggle-hungry-state t)
  (setq c-basic-offset 4)
  (which-function-mode t)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'inextern-lang 0)
  (c-set-offset 'case-label 0)
  (c-set-offset 'label 0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'access-label '-)
  (c-set-offset 'inlambda 0)
  ;; (c-set-offset 'substatement-open 0)
  ;; (c-set-offset 'block-open 0)
  ;; (c-set-offset 'knr-argdecl-intro 0)
  )

(defun my-set-c-highlight()
  (font-lock-add-keywords
   nil
   '(
     ;; add the new C++11 keywords
     ("\\<\\(nullptr\\)\\>" . font-lock-constant-face)
     ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
     ;; Calling macros
     ("\\<\\([_A-Z][_0-9A-Z]*\\)[[:space:]]*(" 1 font-lock-macro-call-face)
     ;; Calling functions
     ("\\<\\([_a-zA-Z]\\sw*\\)[[:space:]]*(" 1 font-lock-function-call-face)
     ;; Invalid number
     ("\\(?:\\b[_a-zA-Z]\\w*\\|\\]\\|)\\)[[:space:]]*\\(?:\\.\\|->\\)[[:space:]]*\\([0-9]\\sw*\\)\\b"
      1 font-lock-warning-face)
     ("\\<\\([0-9]\\sw*\\)[[:space:]]*("
      1 font-lock-warning-face)
     ;; Valid hex floating point number.
     ("\\b0x\\([0-9a-fA-F]+\\(\\.\\)?[0-9a-fA-F]*\\|\\.[0-9a-fA-F]+\\)[pP][-]?[0-9]+[dDlLfF]?\\b"
      . font-lock-string-face)
     ;; Valid hex number (will highlight invalid suffix though)
     ("\\b0x[0-9a-fA-F]+[uUlL]*\\b" . font-lock-string-face)
     ;; Invalid hex number
     ("\\b0x\\(\\w\\|\\.\\)+\\b" . font-lock-warning-face)
     ;; Valid binary number
     ("\\b0b[01]+[uUlL]*\\b" . font-lock-string-face)
     ;; Invalid hex number
     ("\\b0b\\(\\w\\|\\.\\)+\\b" . font-lock-warning-face)
     ;; Valid floating point number.
     ("\\b[0-9]*\\([0-9]\\.\\|\\.[0-9]\\)[0-9]*\\([eE][-]?[0-9]+\\)?[dD]?[lLfF]?\\b"
      . font-lock-string-face)
     ("\\b\\([0-9]+\\(\\.\\)?[0-9]*\\|\\.[0-9]+\\)[eE][-]?[0-9]+[dD]?[lLfF]?\\b"
      . font-lock-string-face)

     ;; Invalid floating point number.  Must be before valid decimal.
     ;; ("\\b[0-9].*?\\..+?\\b" . font-lock-warning-face)

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
     ("\\b[0-9]\\(\\sw\\|\\.\\)+?\\b" . font-lock-warning-face)

     ("\\(?:->\\|\\.\\)[[:space:]]*\\(\\sw+\\)\\b" 1 font-lock-member-face)
     ("\\b\\([_A-Z][_0-9A-Z]*\\)\\b" 1 font-lock-macro-face)
     ) t)
  )

(defun my-c-lineup-topmost-intro-cont (orig-func langelem)
  nil)

(defun my-c-mode()
  (interactive)
  (my-set-c-mode-map)
  (my-set-c-style)
  (my-set-c-highlight)
  (imenu-add-menubar-index)
  (advice-add 'c-lineup-topmost-intro-cont :around
              #'my-c-lineup-topmost-intro-cont))

(if (try-require 'xcscope)
    (progn
      (defun my-cscope-mode()
        (interactive)
        (define-key cscope-list-entry-keymap (kbd "<return>")
          'cscope-select-entry-other-window)
        (define-key cscope-list-entry-keymap (kbd "C-m")
          'cscope-select-entry-other-window))
      (add-hook 'cscope-list-entry-hook 'my-cscope-mode)))

(if (try-require 'doxymacs)
    (progn
      (defun my-doxymacs-font-lock ()
        (font-lock-add-keywords nil doxymacs-doxygen-keywords))
      (add-hook 'c-mode-common-hook 'doxymacs-mode)
      (add-hook 'c-mode-common-hook 'my-doxymacs-font-lock)))
