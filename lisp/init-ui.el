(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/moe-theme.el/")

(require 'parse-time)
(require 'moe-theme)
(setq-local hourOfTheDay (nth 2 (parse-time-string (current-time-string))))
(if (or (<= hourOfTheDay 8) (>= hourOfTheDay 18)) (load-theme 'moe-dark t) (load-theme 'moe-light t))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(setq-default cursor-type 'bar)
(setq inhibit-splash-screen 1)
(set-face-attribute 'default nil :height 180)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(global-hl-line-mode)

(provide 'init-ui)
