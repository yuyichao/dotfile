(when (> (length (getenv "DISPLAY")) 0)
  (when (not window-system)
    (require 'xclip)
    (turn-on-xclip)
    (require 'xterm-title)
    (xterm-title-mode t)
    (xterm-mouse-mode t))
  (when (window-system)
    (setq x-select-enable-clipboard t))
  )
