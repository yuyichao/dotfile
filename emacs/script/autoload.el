(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(add-to-list 'auto-mode-alist
             '("/\\(_\\)?PKGBUILD\\(-git\\)?$" . pkgbuild-mode))

(autoload 'php-mode "php-mode.el" "Php mode." t)
(add-to-list 'auto-mode-alist '("\.php[345]?$" . php-mode))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\.md$" . markdown-mode))

(autoload 'js2-mode "js2-mode.el" "Javascript mode." t)
(add-to-list 'auto-mode-alist '("\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\.json$" . js2-mode))

(autoload 'vala-mode "vala-mode.el" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\.vapi$" . utf-8))
(require 'mmm-mode)

(autoload 'cmake-mode "cmake-mode.el" "CMake mode" t)
(add-to-list 'auto-mode-alist '("CMakeLists\.txt$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\.cmake$" . cmake-mode))

(require 'go-mode-load)

(require 'egg)
(require 'multi-term)

(autoload 'lua-mode "lua-mode.el" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\.lua$" . lua-mode))
