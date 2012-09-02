(defun backward-kill-line (arg)
  (interactive "p")
  (kill-line 0))
;; (global-set-key (quote [67108908]) 'shrink-window)
;; (global-set-key (quote [67108910]) 'enlarge-window)
;; (global-set-key (quote [67108924]) 'shrink-window-horizontally)
;; (global-set-key (quote [67108926]) 'enlarge-window-horizontally)

;; keys to play arround with:
;; C-h; C-_(C-/, C--); C-]
;; C-x's :
;; C-a; C-h;
;; almost all C-c's
(global-set-key (kbd "C-_") 'backward-kill-line)
(global-set-key (kbd "C-/") 'backward-kill-line)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-q") 'move-beginning-of-line)
;; looking for a better one....
(global-set-key (kbd "C-h") 'quoted-insert)
(global-set-key (kbd "C-x <home>") 'toggle-read-only)
(global-set-key (kbd "C-x h") 'help-command)
(global-set-key (kbd "C-x h C-x h") 'help-for-help)
(global-set-key (kbd "C-x <down>") 'set-goal-column)
(global-set-key (kbd "C-x C-k <down>") 'kmacro-cycle-ring-next)
(global-set-key (kbd "C-x h <down>") 'view-emacs-news)
(global-set-key (kbd "C-x <up>") 'mark-page)
(global-set-key (kbd "C-x C-k <up>") 'kmacro-cycle-ring-previous)
(global-set-key (kbd "C-x h <up>") 'view-emacs-problems)
(global-set-key (kbd "C-x <left>") 'list-buffers)
(global-set-key (kbd "C-x <right>") 'find-file)
(global-set-key (kbd "C-x C-k <right>") 'kmacro-set-format)
(global-set-key (kbd "C-x 4 <right>") 'find-file-other-window)
(global-set-key (kbd "C-x 5 <right>") 'find-file-other-frame)
(global-set-key (kbd "C-x h <right>") 'view-emacs-FAQ)
(global-set-key (kbd "C-x <delete>") 'list-directory)
(global-set-key (kbd "C-x C-k <delete>") 'kmacro-delete-ring-head)
(global-set-key (kbd "C-x h <delete>") 'view-emacs-debugging)
(global-set-key (kbd "C-x <end>") 'help-command)
(global-set-key (kbd "C-x C-k <end>") 'kmacro-edit-macro-repeat)
(global-set-key (kbd "C-x h <end>") 'view-external-packages)
(global-set-key (kbd "C-c C-w") 'delete-region)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "<return>") 'newline-and-indent)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c C-j") 'comment-region)
(global-set-key (kbd "C-c C-k") 'uncomment-region)
(global-set-key (kbd "C-\\") 'indent-region)
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  ;; for Makefile....
  ;; (untabify (point-min) (point-max))
  )
(global-set-key (kbd "C-c i b") 'iwb)
(global-set-key (kbd "C-c m t") 'multi-term)
;; (define-key minibuffer-local-completion-map (kbd "C-m")
;;   'minibuffer-complete-and-exit)
;; (define-key minibuffer-local-completion-map (kbd "<return>")
;;   'minibuffer-complete-and-exit)
;; (define-key minibuffer-local-map (kbd "C-m") 'exit-minibuffer)
;; (define-key minibuffer-local-map (kbd "<return>") 'exit-minibuffer)
(define-key minibuffer-local-completion-map (kbd "C-m")
  'exit-minibuffer)
(define-key minibuffer-local-completion-map (kbd "<return>")
  'exit-minibuffer)
(eval-after-load "sgml-mode"
  '(define-key html-mode-map (kbd "C-c C-j") 'comment-region))
