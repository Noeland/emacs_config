;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
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

(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/moe-theme.el/")

(auto-revert-mode t)

(require 'parse-time)
(require 'moe-theme)
(setq-local hourOfTheDay (nth 2 (parse-time-string (current-time-string))))
(if (>= hourOfTheDay 18) (load-theme 'moe-dark t) (load-theme 'moe-light t))

(setq-default fill-column 80)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-linum-mode 1)

(setq-default cursor-type 'bar)

(setq inhibit-splash-screen 1)

(set-face-attribute 'default nil :height 170)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f3>") 'open-init-file)

(setq make-backup-files nil)

(global-company-mode t)

(require 'org)
(setq org-src-fontify-natively t)
(global-set-key (kbd "C-c l") 'org-store-link)


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode)

(require 'hungry-delete)
(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h c") 'counsel-)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)

(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

(setq org-agenda-files '("~/Documents/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; set gdb address
(setq gud-gdb-command-name "/usr/local/bin/gdb -i=mi --annotate=3")

(require 'popwin)
(popwin-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(custom-safe-themes
   (quote
    ("74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "1b386f9d14ac6e9ae88ab3993ccf4ccb67d0cb196b4279126a85bd8e03269f7d" "8dc4a35c94398efd7efee3da06a82569f660af8790285cd211be006324a4c19a" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
