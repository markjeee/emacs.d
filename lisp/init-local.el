
(load-theme 'grandshell t)
(enable-theme 'grandshell)

(provide 'init-local)

(add-hook 'java-mode-hook
          (lambda()
            (setq tab-width 2)))

(smart-tabs-insinuate 'java 'javascript)
