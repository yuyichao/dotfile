(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/\\(_\\|\\)PKGBUILD\\(-git\\|\\)$"
                                 . pkgbuild-mode)) auto-mode-alist))

(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist (append '(("/*.\.md$" . markdown-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("/*.\.kwinscript$" . js-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("/*.\.json$" . js-mode)) auto-mode-alist))

;;(require 'cc-mode)
;;(c-initialize-cc-mode t)
;;(c-init-language-vars qt-mode)
;;(c-common-init 'qt-mode)

(setq auto-mode-alist (append '(("/*.\.h$" . c++-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("/*.\.cpp$" . c++-mode)) auto-mode-alist))
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)

(add-to-list 'auto-mode-alist '("\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\.vapi$" . utf-8))
(require 'mmm-mode)

(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))
(require 'go-mode-load)
(require 'cedet)
(require 'egg)
(require 'multi-term)
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
