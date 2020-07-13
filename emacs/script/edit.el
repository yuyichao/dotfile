(setq-default indent-tabs-mode nil)
(require 'whitespace)
;; (global-whitespace-mode t)
;; (global-whitespace-newline-mode t)

;; (load "folding" 'nomessage 'noerror)
;; (folding-add-to-marks-list 'python-mode "# {{{" "# }}}" nil t)
;; (folding-mode-add-find-file-hook)

(when (fboundp 'global-eldoc-mode))
  (global-eldoc-mode -1))
