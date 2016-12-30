
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

(provide 'init-packages)
