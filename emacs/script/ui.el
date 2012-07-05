(setq inhibit-startup-screen t)
;(setq frame-title-format "%n%F  %b")
(setq frame-title-format "%b")
(setq mouse-yank-at-point -1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;(setq scroll-step 1) ;; keyboard scroll one line at a time
(set-window-vscroll nil .5)
(setq global-linum-mode t)
(setq show-paren-mode t)
(setq global-font-lock-mode t)
(setq auto-image-file-mode t)
(setq column-number-mode t)
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if window-system
    (set-background-color "light goldenrod yellow"))
(defun show-tab ()
  (interactive)
  (if standard-display-table
      (if (eq (aref standard-display-table ?\t) nil)
          (standard-display-ascii ?\t "↹       ")
        (aset standard-display-table ?\t nil)
        )
    (standard-display-ascii ?\t "↹       ")
    )
  (message (concat (aref standard-display-table ?\t))))
(defun fake () ())
(setq ring-bell-function 'fake)
