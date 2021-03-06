(condition-case nil
    (progn
      (load "auctex.el" nil t t)
      (load "preview-latex.el" nil t t))
  (error nil))
(defun my-latex-mode()
  (interactive)
  (define-key LaTeX-mode-map [return] 'newline-and-indent)
  (setq indent-tabs-mode nil)
  )
(add-hook 'LaTeX-mode-hook 'my-latex-mode)
(setq TeX-view-program-selection '((output-pdf "xdg-open")
                                   (output-dvi "xdg-open")
                                   (output-html "xdg-open")))
