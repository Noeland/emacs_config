(auto-revert-mode t)
(delete-selection-mode t)
(setq-default fill-column 80)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
;; set gdb address
(setq gud-gdb-command-name "/usr/local/bin/gdb -i=mi --annotate=3")

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))



(provide 'init-better-defaults)
