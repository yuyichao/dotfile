(setq default-directory "~/")
(setq backup-inhibited t)
(setq visible-bell nil)
(setq current-language-environment "UTF-8")
(setq imenu-sort-function 'imenu--sort-by-name)
(defadvice find-file
  (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir t)))))
