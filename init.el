(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-custom)
(require 'init-org)

(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))










