;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Pontus Englund @ Emacs Configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set package archives
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

;; Activate all the packages (in particular autoloads)
(package-initialize)

;; Default packages
(setq package-list '(ahg auto-complete-rst auto-complete popup calmer-forest-theme elpy yasnippet pyvenv highlight-indentation find-file-in-project swiper company find-file-in-project swiper flycheck let-alist pkg-info epl dash flymake-json flymake-easy highlight-indentation jedi auto-complete popup jedi-core python-environment deferred epc ctable concurrent deferred jedi-core python-environment deferred epc ctable concurrent deferred json-mode json-snatcher json-reformat json-reformat json-snatcher let-alist neotree pkg-info epl popup py-isort python-environment deferred pyvenv sphinx-doc dash s swiper yasnippet editorconfig markdown-mode protobuf-mode))

;; Fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Hooks
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'python-mode-hook (lambda ()
		  (require 'sphinx-doc)
		  (sphinx-doc-mode t)))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(custom-enabled-themes (quote (wheatgrass)))
(custom-set-variables
 '(custom-safe-themes (quote ("7997e0765add4bfcdecb5ac3ee7f64bbb03018fb1ac5597c64ccca8c88b1262f" default))))
(load-theme 'calmer-forest t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Display Column number
(setq column-number-mode t)

;; set default font size:
(set-face-attribute 'default nil :height 89)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; So that emacs don't complain about the wrong encoding.
(define-coding-system-alias 'UTF-8 'utf-8)

;;initalize ido-mode
(require 'ido)
(ido-mode t)

;; Auto revert buffer
(global-auto-revert-mode)

;;Key-bindings:
(global-set-key [134217760] (quote hippie-expand))

;;(global-set-key (kbd "\C-o") 'python-completion-complete-at-point)
(global-set-key [15] (quote python-shell-completion-complete-or-indent))

;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)
(setq org-log-done t)
(setq org-todo-keyword-faces
	'(("IN-PROGRESS" . "yellow")("WAITING" . "orange")("UPCOMING" . "deep sky blue")))
(setq org-todo-keywords
	'((sequence "TODO" "IN-PROGRESS" "WAITING" "UPCOMING" "DONE")))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ;; this line activates ditaa

;; Auto open file at startup
;;(setq org-default-notes-file "~/Documents/todo.org"
;;	initial-buffer-choice org-default-notes-file)
