(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(add-to-list 'auto-mode-alist
             '("/\\(_\\)?PKGBUILD\\(-git\\)?$" . pkgbuild-mode))
;; Web

(autoload 'php-mode "php-mode.el" "Php mode." t)
(add-to-list 'auto-mode-alist '("\\.php[345]?$" . php-mode))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

(if (try-require 'web-mode)
    (progn
      (add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.[agj]sp$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.as[cp]x$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.mustache$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.djhtml$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.scss$" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.xml$" . web-mode))
      (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
      (defun my-web-mode-hook ()
        (setq web-mode-markup-indent-offset 2)
        (setq web-mode-css-indent-offset 2)
        (setq web-mode-code-indent-offset 4)
        (setq web-mode-script-padding 4)
        (setq web-mode-attr-indent-offset 2)
        (setq web-mode-enable-css-colorization t)
        ;; (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
        ;; (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
        ;; (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
        ;; (add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
        ;; (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
        ;; (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
        ;; (setq web-mode-comment-formats
        ;;       '(("java"       . "/*")
        ;;         ("javascript" . "//")
        ;;         ("php"        . "/*")
        ;;         ))
        ;; (define-key (current-local-map) (kbd "M-'") 'web-mode-comment-or-uncomment)
        ;; (when (string-match "\\.html?$" buffer-file-name)
        ;;   (electric-indent-local-mode -1))
        )
      (add-hook 'web-mode-hook  'my-web-mode-hook))
  (progn
    (add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
    ))
;; You can also edit plain js, jsx, css, scss, xml files.

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(autoload 'qml-mode "qml-mode.el" "Qml mode." t)
(add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))

(autoload 'vala-mode "vala-mode.el" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))
(try-require 'mmm-mode)

;; TODO
(add-to-list 'load-path "/usr/share/cmake-3.0/editors/emacs")
(autoload 'cmake-mode "cmake-mode.el" "CMake mode" t)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))

(autoload 'cmake-edit-mode "cmake-edit-mode.el" "CMake Edit mode" t)

(try-require 'go-mode-load)

(try-require 'egg)
(try-require 'multi-term)

(autoload 'lua-mode "lua-mode.el" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

(autoload 'cython-mode "cython-mode.el" "Major mode for Cython development." t)
(add-to-list 'auto-mode-alist '("\\.pyx$" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxd$" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxi$" . cython-mode))

(add-to-list 'auto-mode-alist '("\\.fxaddon$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.desc$" . conf-mode))
(add-to-list 'auto-mode-alist '("Doxyfile" . conf-mode))

(add-to-list 'auto-mode-alist '("\\.sh$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . sh-mode))
(add-to-list 'auto-mode-alist '("zshrc$" . sh-mode))
(add-to-list 'auto-mode-alist '("bashrc$" . sh-mode))

(add-to-list 'auto-mode-alist '("fbtermrc$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("muttrc$" . sh-mode))

;; (if (try-require 'multi-web-mode)
;;     (progn
;;       (setq mweb-default-major-mode 'html-mode)
;;       (setq mweb-tags '((php-mode "<\\?php\\|<\\? \|<\\?=" "\\?>")
;;                         (js-mode "<script\\( [^>]*\\)?>" "</script>")
;;                         (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;;       (setq mweb-filename-extensions
;;             '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;;       (multi-web-global-mode 1)))

(defun load-cmake-hook()
  (add-hook 'cmake-mode-hook 'my-cmake-mode))
(eval-after-load "cmake-mode" '(load-cmake-hook))
(autoload 'andersl-cmake-font-lock-activate "andersl-cmake-font-lock" nil t)

(defun my-cmake-mode()
  (interactive)
  (andersl-cmake-font-lock-activate)
  (font-lock-add-keywords
   nil
   '(
     ;; options
     ("\\<\\([_a-zA-Z]\\sw*:\\)" 1 font-lock-keyword-face)
     ("\\<\\([_a-zA-Z]\\sw*\\[\\]:\\)" 1 font-lock-constant-face)
     ("\\<[Mm][Aa][Cc][Rr][Oo][[:space:]]*([[:space:]]*\\([^[:space:])]*\\)" 1
      font-lock-member-face)
     ("\\<[Ff][Uu][Nn][Cc][Tt][Ii][Oo][Nn][[:space:]]*([[:space:]]*\\([^[:space:])]*\\)" 1 font-lock-function-call-face)
     ("\\<[Ss][Ee][Tt][[:space:]]*([[:space:]]*\\([^[:space:])]*\\)" 1 font-lock-variable-name-face)
     ("\\<[Ff][Oo][Rr][Ee][Aa][Cc][Hh][[:space:]]*([[:space:]]*\\([^[:space:])]*\\)" 1 font-lock-variable-name-face)
     ("\\<[Ii][Nn][Cc][Ll][Uu][Dd][Ee][[:space:]]*([[:space:]]*\\([^[:space:])]*\\)" 1 font-lock-constant-face)
     ;; ("\\<\\${\\(.*\\)}" 1 font-lock-variable-name-face)
     ) t))

(add-to-list 'auto-mode-alist '("\\.m?$" . octave-mode))
(setq octave-continuation-string "...")
(setq octave-comment-start "%")

(autoload 'llvm-mode "llvm-mode.el"
  "Major mode for editing LLVM IR files" t)
(add-to-list 'auto-mode-alist '("\\.ll$" . llvm-mode))

(autoload 'yaml-mode "yaml-mode.el"
  "Major mode for editing YAML files" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(autoload 'go-mode "go-mode.el" "Go mode." t)
(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
