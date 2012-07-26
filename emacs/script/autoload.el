(autoload 'python-mode "python-mode.el" "Python mode." t)
(add-to-list 'auto-mode-alist '("/*.\.py$" . python-mode))

(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(add-to-list 'auto-mode-alist
             '("/\\(_\\|\\)PKGBUILD\\(-git\\|\\)$" . pkgbuild-mode))

(autoload 'php-mode "php-mode.el" "Php mode." t)
(add-to-list 'auto-mode-alist '("/*.\.php[345]?$" . php-mode))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("/*.\.md$" . markdown-mode))

(add-to-list 'auto-mode-alist '("/*.\.kwinscript$" . js-mode))
(add-to-list 'auto-mode-alist '("/*.\.json$" . js-mode))

(require 'cc-mode)
;; (c-initialize-cc-mode t)
;; (c-init-language-vars qt-mode)
;; (c-common-init 'qt-mode)

(add-to-list 'auto-mode-alist '("/*.\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("/*.\.cpp$" . c++-mode))

(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\.vapi$" . utf-8))
(require 'mmm-mode)

(require 'cmake-mode)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

(require 'go-mode-load)
(require 'cedet)
(require 'egg)
(require 'multi-term)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\.lua$" . lua-mode))
