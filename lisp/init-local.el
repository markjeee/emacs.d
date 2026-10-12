
(when (ignore-errors (load-theme 'grandshell t))
  (enable-theme 'grandshell))

;; Scroll up with Control-Shift-V, keeping Control-V for scrolling down.
(global-set-key (kbd "C-S-v") 'scroll-down-command)

(provide 'init-local)
