(try-require 'org-install)
(setq org-hide-leading-stars t)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)
;; (setq org-display-custom-times t)
;; (setq org-time-stamp-custom-formats
;;       '("<%Y-%m-%d(%u)>" . "<%Y-%m-%d(%u)%H:%M>"))
