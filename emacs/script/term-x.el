;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (> (length (getenv "DISPLAY")) 0)
  (when (not window-system)
    (require 'xclip)
    (turn-on-xclip)
    (require 'xterm-title)
    ;; (xterm-title-mode t)
    (xterm-mouse-mode t))
  (when (window-system)
    (setq x-select-enable-clipboard t)
    (set-frame-parameter (selected-frame) 'alpha '(80 80))
    (shell-command
     (concat "xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c "
             "-set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id "
             (frame-parameter (selected-frame) 'outer-window-id)))
    (add-to-list 'default-frame-alist '(alpha 80 80)))
  )
