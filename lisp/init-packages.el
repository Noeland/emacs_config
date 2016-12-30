
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" .  "http://melpa.org/packages/") t)
  )

(require 'cl)

;; add whatever packages you want here

(defvar huanming/packages '(
			    company
			    moe-theme
 			    hungry-delete
			    swiper
			    counsel
			    smartparens
			    org
			    popwin
			    utop
			    opam
			    exec-path-from-shell
			    ) "Default packages" )

(setq-default package-selected-packages huanming/packages)

(defun huanming/packages-installed-p ()
  (loop for pkg in huanming/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
  
  (unless (huanming/packages-installed-p)              ;; If this is not ture
    (message "%s" "Refresing packages database...")    ;; Send msg and resfresh
    (package-refresh-contents)
    (dolist (pkg huanming/packages)                    ;; For all pkg in huanming/packages
      (when (not (package-installed-p pkg))            ;; if it is not installed
	(package-install pkg))))                      ;; Install it

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'c-mode-hook 'smartparens-mode)
(add-hook 'c++-mode 'smartparens-mode)

(global-company-mode t)

(require 'popwin)
(popwin-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)



(setq utop-command "opam config exec -- utop -emacs")
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(opam-init)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; tuareg config
(load
 "/Users/Apple/.opam/system/share/emacs/site-lisp/tuareg-site-file")

;; merlin config
(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
 (when (and opam-share (file-directory-p opam-share))
  (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
  (autoload 'merlin-mode "merlin" nil t nil)
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)))

(add-hook 'tuareg-mode-hook 'merlin-mode)

(provide 'init-packages)
