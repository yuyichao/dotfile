(add-to-list 'load-path "~/.emacs.d/module")
(setq py-use-number-face-p nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command-style '(("" "%(PDF)%(latex) --shell-escape %S%(PDFout)")))
 '(TeX-PDF-mode t)
 '(TeX-debug-bad-boxes t)
 '(TeX-debug-warnings t)
 '(font-use-system-font t)
 '(global-linum-mode t)
 '(global-whitespace-mode t)
 ;; '(global-whitespace-newline-mode t)
 '(pdb-path (quote /usr/lib/python3\.2/pdb\.py))
 '(py-beep-if-tab-change nil)
 '(py-complete-function (quote py-shell-complete))
 '(py-hide-show-minor-mode-p t)
 '(py-use-number-face-p nil)
 '(py-shebang-startstring "#!/usr/bin/env python")
 '(py-start-run-ipython-shell nil)
 '(py-start-run-py-shell nil)
 '(safe-local-variable-values '((js-indent-level . 4)
                                (sh-basic-offset . 4) (sh-indent-comment . t)
                                (py-indent-offset . 4) (js2-basic-offset . 4)))
 '(sh-shell-file "/bin/bash")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(which-function-mode t)
 '(whitespace-style '(face tabs spaces trailing space-before-tab ; lines
                           newline indentation empty space-after-tab
                           space-mark tab-mark newline-mark))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-string-face ((t (:foreground "deeppink"))))
 '(py-builtins-face ((t (:inherit font-lock-builtin-face :foreground "green"))))
 '(whitespace-line ((t (:background "#c0ffff"))))
 '(whitespace-space ((((class color) (background light))
                      (:foreground "lightgray"))))
 '(whitespace-tab ((((class color) (background light))
                    (:foreground "lightgray")))))

(mapc 'load (directory-files "~/.emacs.d/script/" t "\\.el$"))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
