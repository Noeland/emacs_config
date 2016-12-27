(require 'org)
(setq org-src-fontify-natively t)
(global-set-key (kbd "C-c l") 'org-store-link)
(setq org-agenda-files '("~/Documents/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
