(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(add-to-list 'auto-mode-alist
             '("/\\(_\\)?PKGBUILD\\(-git\\)?$" . pkgbuild-mode))

(autoload 'php-mode "php-mode.el" "Php mode." t)
(add-to-list 'auto-mode-alist '("\\.php[345]?$" . php-mode))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; (autoload 'js2-mode "js2-mode.el" "Javascript mode." t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
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

(if (try-require 'multi-web-mode)
    (progn
      (setq mweb-default-major-mode 'html-mode)
      (setq mweb-tags '((php-mode "<\\?php\\|<\\? \|<\\?=" "\\?>")
                        (js-mode "<script\\( [^>]*\\)?>" "</script>")
                        (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
      (setq mweb-filename-extensions
            '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
      (multi-web-global-mode 1)))

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
