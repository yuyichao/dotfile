(add-to-list 'load-path "~/.emacs.d/module")
(setq py-use-number-face-p nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command-style (quote (("" "%(PDF)%(latex) --shell-escape %S%(PDFout)"))))
 '(TeX-PDF-mode t)
 '(TeX-debug-bad-boxes t)
 '(TeX-debug-warnings t)
 '(auto-save-list-file-prefix "~/.emacs.d/auto-save-list/saves-")
 '(c-doc-comment-style (quote ((java-mode . javadoc) (pike-mode . autodoc))))
 '(c-label-minimum-indentation (quote set-from-style))
 '(column-number-mode t)
 '(global-whitespace-mode t)
 '(history-length t)
 '(julia-indent-offset 4)
 '(octave-block-offset 4)
 '(pdb-path (quote /usr/lib/python3\.3/pdb\.py))
 '(py-beep-if-tab-change nil)
 '(py-complete-function (quote py-shell-complete))
 '(py-hide-show-minor-mode-p t)
 '(py-shebang-startstring "#!/usr/bin/env python")
 '(py-start-run-ipython-shell nil)
 '(py-start-run-py-shell nil)
 '(py-use-number-face-p nil t)
 '(safe-local-variable-values
   (quote
    ((eval c-set-offset
           (quote arglist-close)
           0)
     (eval c-set-offset
           (quote arglist-intro)
           (quote ++))
     (eval c-set-offset
           (quote case-label)
           0)
     (eval c-set-offset
           (quote statement-case-open)
           0)
     (eval c-set-offset
           (quote substatement-open)
           0)
     (c-file-offsets
      (innamespace . 0)
      (inline-open . 0)
      (case-label . +))
     (eval progn
           (c-set-offset
            (quote innamespace)
            (quote 0))
           (c-set-offset
            (quote inline-open)
            (quote 0)))
     (js2-basic-offset . 4)
     (js-indent-level . 4)
     (sh-basic-offset . 4)
     (sh-indent-comment . t)
     (py-indent-offset . 4))))
 '(savehist-file "~/.emacs.d/savehist")
 '(savehist-mode t)
 '(sh-shell-file "/bin/bash")
 '(show-paren-mode t)
 '(tab-width 8)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks t)
 '(verilog-align-ifelse t)
 '(verilog-auto-lineup (quote ignore))
 '(verilog-auto-newline nil)
 '(verilog-minimum-comment-distance 0)
 '(which-function-mode t)
 '(whitespace-style
   (quote
    (face tabs spaces trailing space-before-tab indentation empty space-after-tab space-mark tab-mark))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :height 115 :width normal :slant normal :weight bold))))
 '(font-lock-string-face ((t (:foreground "deeppink"))))
 '(linum ((t (:inherit (shadow default) :background "#00ff87" :foreground "#0000ff" :weight bold))))
 '(mode-line ((t (:background "#afd7ff" :foreground "#00af00" :box (:line-width -1 :style released-button)))))
 '(mode-line-buffer-id ((t (:foreground "#0087ff" :underline t :weight bold))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#000000" :foreground "white" :box (:line-width -1 :color "grey75") :weight light))))
 '(py-builtins-face ((t (:inherit font-lock-builtin-face :foreground "green"))))
 '(whitespace-line ((t (:background "#c0ffff"))))
 '(whitespace-space ((((class color) (background light)) (:foreground "lightgray"))))
 '(whitespace-tab ((((class color) (background light)) (:foreground "lightgray")))))

(mapc 'load (directory-files "~/.emacs.d/script/" t "\\.el$"))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
