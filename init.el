;;; package -- Summary
;;; Commentary:
;;; Code:


(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; Requires
(defun requires ()
  "Just a little way to define all the requires."
  (require 'package)
  (require 'package)
  (require 'whitespace)
  (require 'lsp-mode)
  (require 'dap-dlv-go)

  (require 'dap-python)
  (require 'treesit))
 

(defun packages ()
  ;; comments
  (use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))
  (use-package petn
    :ensure t)
  (use-package solaire-mode
    :ensure t)
  (use-package inf-ruby
    :ensure t)
  (use-package realgud
    :ensure t)
  (use-package editorconfig
    :ensure t
    :config (editorconfig-mode +1))
  (use-package indium
    :ensure t)
  (use-package dap-mode
    :after lsp-mode
    :commands dap-debug
    :hook ((python-mode . dap-ui-mode)
	   (python-mode . dap-mode)))
  (use-package ef-themes :ensure t)
  (use-package lsp-mode :ensure t)
  "Just a little function to install all the packages."
  (use-package evil :ensure t)
  (use-package treemacs :ensure t)
  (use-package go-mode :ensure t)
  (use-package vterm :ensure t)
  (use-package ein :ensure t)
  (use-package ob-restclient :ensure t)
  (use-package verb :ensure t)
  (use-package ace-window
    :ensure t)
  (use-package typescript-mode
    :after lsp-mode
    :mode ("\.ts$")
    :hook (typescript-mode . lsp-deferred)
    :ensure t)
  (use-package dired-subtree
    :ensure t)
  (use-package sublime-themes
    :ensure t)

  (use-package lsp-ui
    :ensure t)
  (use-package creamsody-theme :ensure t)
  (use-package autothemer
  :ensure t)
  (use-package load-env-vars
  :ensure t)
  (use-package corfu
    :ensure t
    :custom
    (corfu-auto t))
  (use-package emacs
    :init
    (setq completion-cycle-threshold 3))
  (use-package company
    :ensure t)
  (use-package powerline
    :ensure t)
  (use-package eww
    :ensure t)
  (use-package elixir-mode
    :ensure t)
  (use-package inf-elixir
    :ensure t)
  (use-package python-black
    :ensure t
    :after python)
  (use-package py-isort
    :ensure t)
  (use-package lsp-pyright
    :ensure t
    :hook (python-mode . (lambda ()
			   (require 'lsp-pyright)))
    :init (when (executable-find "python3")
	    (setq lsp-pyright-python-executable-cmd "python3")))
  (use-package python-isort
    :ensure t)
  (use-package pyvenv
    :ensure t
    :config (pyvenv-mode 1))
  (use-package dockerfile-mode
    :ensure t)
  (use-package terraform-mode
    :ensure t)
  (use-package org
    :ensure t)
  (use-package yaml-mode
    :ensure t)
  (use-package magit
    :ensure t)
  (use-package exec-path-from-shell
    :ensure t)
  (use-package vertico
    :ensure t)
  (use-package vertico-posframe
    :ensure t)
  (use-package consult
    :ensure t)
  (use-package flycheck-inline
    :ensure t)
  (use-package rjsx-mode
    :ensure t)
  (use-package typescript-mode
    :ensure t)
  (use-package web-mode
    :ensure t)
  (use-package lsp-mode
    :commands (lsp lsp-deferred)
    :ensure t)
  (use-package neotree
    :ensure t)
  (use-package ace-window
    :ensure t)
  (use-package flycheck-golangci-lint
    :ensure t))


(defun setqs ()
  "Run all the seq."
  (setq vertico-posframe-height 50)
  (setq vertico-count 49)
  (setq ring-bell-function 'ignore)
  (setq-default tab-width 8)
  (setq frame-resize-pixelwise t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-doc-max-height 150)
  (setq default-frame-alist '((undecorated . t)))
  (setq ts-indent-level 2)
  (setq corfu-auto-prefix 1)
  (setq corfu-auto-delay 1))

(defun enlarge-current-window ()
  (interactive)
  (enlarge-window (round (* (window-width) .1)) t))

(defun shrink-current-window ()
  (interactive)
  (shrink-window (round (* (window-width) .1)) t))

;; Keybindings
;;(keymap-global-set (
(defun keymaps ()
  "Set all the keymaps."
  (keymap-global-set "C-c w h" 'windmove-left)
  (keymap-global-set "C-c w l" 'windmove-right)
  (keymap-global-set "C-c w j" 'windmove-up)
  (keymap-global-set "C-c w k" 'windmove-down)
  (keymap-global-set "C-x !" 'flymake-show-buffer-diagnostics)
  (keymap-global-set "C-x t t" 'tab-bar-switch-to-next-tab)
  (keymap-global-set "C-x n t" 'tab-new)
  (keymap-global-set "C-x t l" 'lsp-ui-doc-show)
  (keymap-global-set "C-x t L" 'lsp-ui-doc)
  (keymap-global-set "C-x t e" 'flymake-show-diagnostic)
  (keymap-global-set  "C-x a b" 'dap-breakpoint-toggle)
  (keymap-global-set  "C-x v t" 'multi-vterm)
  (keymap-global-set "C-c w e" 'enlarge-current-window)
  (keymap-global-set "C-c w d" 'shrink-current-window)
  (keymap-global-set  "C-x f" 'consult-ripgrep)
  (with-eval-after-load 'org
    (define-key org-mode-map (kbd "C-c C-r") verb-command-map)))
;; End keybindings

(defun bootstrap ()
  "Bootstrap."
  (defvar bootstrap-version)
  (let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
	(bootstrap-version 6))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer (url-retrieve-synchronously "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el" 'silent 'inhibit-cookies)
	(goto-char (point-max))
	(eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage)))

(defun my-set-margins (amount)
  "Set margins in current buffer."
  (setq left-margin-width amount)
  (setq right-margin-width amount))

(defun set-margins ()
  (interactive)
  (set-window-margins (selected-window) 10 10))
  ;;(set-window-margins 20 20))
;;(my-set-margins 20))

(defvar *haba-theme-dark* 'doom-wilmersdorf)
(defvar *haba-theme-light* 'mccarthy)
(defvar *haba-current-theme* *haba-theme-dark*)

;; disable other themes before loading new one
(defadvice load-theme (before theme-dont-propagate activate)
  "Disable theme before loading new one."
  (mapc #'disable-theme custom-enabled-themes))

 
(defun haba/next-theme (theme)
  (disable-theme *haba-current-theme*)
  (progn
    (load-theme theme t))
  (setq *haba-current-theme* theme)
  (set-frame-font "IBM Plex Mono-12" nil t))

(defun haba/toggle-theme ()
  (interactive)
  (cond ((eq *haba-current-theme* *haba-theme-dark*) (haba/next-theme *haba-theme-light*))
        ((eq *haba-current-theme* *haba-theme-light*) (haba/next-theme *haba-theme-dark*))))


(global-set-key [f5] 'haba/toggle-theme)

(defun theming ()
  (require 'neotree)
  (solaire-global-mode +1)
  (require 'powerline)
  ;;(powerline-default-theme)
  (setq scroll-step            1
      scroll-conservatively  10000)
  "All the configs for theming and ui."
  ;;(global-whitespace-mode t)
  ;;(add-hook 'prog-mode-hook 'my-set-margins)
  ;;(set-window-margins (selpected-window) 15 15)
  (setq neo-window-fixed-size nil) 
  ;;(add-to-list 'default-frame-alist '(font . "CozetteVector-14"))
  ;;(set-frame-font "CozetteVector-14" nil t)
  ;;  (add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font-10"))
  (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-12"))
  ;;(set-frame-font "FiraCode Nerd Font-10" nil t)
  (set-frame-font "IBM Plex Mono-12" nil t)
  (set-frame-parameter (selected-frame) 'alpha '(100. 100))
  (setq-default left-margin-width 0 right-margin-width 0 internal-border-width 0) ; Define new widths.
  (set-window-buffer nil (current-buffer)) ; Use them now.
  (custom-set-variables '(neo-window-position (quote right)))

  (set-face-attribute
   'default nil
   :font "IBM Plex Mono"
   :height 12
   :weight 'regular)
  ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
  ;; (set-face-attribute
  ;;  'default nil
  ;;  :font "CozzeteVector"
  ;;  :height 12
  ;;  :weight 'regular)

  ;;(load-theme 'timu-rouge t)
  ;; (load-theme 'zenburn t)
  ;;(load-theme 'ef-autumn)
  ;;(load-theme 'poet-dark t)
  (load-theme 'doom-wilmersdorf t)
  ;;(set-background-color "#111111")
  
  ;; (load-theme 'poet t)
  ;; (set-background-color "#f2f2f2") 
  
  ;;(add-to-list 'default-frame-alist '(background-color . "#111111"))
  (add-to-list 'default-frame-alist '(alpha 100 100))
  
  
  
  ;;(load-theme 'modus-vivendi t)
  ;; (load-theme 'modus-operandi t)
  (setq ring-bell-function 'ignore)
  (setq lsp-headerline-breadcrumb-enable nil)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (global-hl-line-mode -1)
  (line-number-mode 1)
  (setq display-line-numbers 'absolute)
  (vertico-mode 1)
  (tooltip-mode -1)           ; Disable tooltips
  (set-fringe-mode 10)        ; Give some breathing roo
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
  (vertico-posframe-mode 1)
  (global-flycheck-mode)
  (setq neo-theme (if (display-graphic-p) 'arrow 'arrow))
  ;;(setq-default mode-line-format 'nil)
  (add-hook 'flycheck-mode-hook 'flycheck-inline-mode))
;; End Theme

(defun prog-time ()
  "All the programming languages stuff."
  (auto-revert-mode 1)
  ;; (add-hook 'gleam-mode #'lsp-deferred)
  ;; (add-hook 'elixir-mode-hook (lambda ()
  ;; 				(add-hook 'before-save-hook 'elixir-format nil t)))
  ;; (add-hook 'elixir-mode-hook #'lsp-deferred)
  ;; (add-hook 'typescript-mode #'lsp-deferred)
  (add-hook 'typescript-mode #'lsp-deferred)
  (setq typsecript-indent-level 2)


  ;; GO TIME
  (require 'lsp-mode)
  (add-hook 'go-mode-hook #'lsp-deferred)
  (add-hook 'go-mode-hook #'line-number-mode)
  
  ;; Set up before-save hooks to format buffer and add/delete imports.
  ;; Make sure you don't have other gofmt/goimports hooks enabled.
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  
  ;; END GO TIME
  
  
  ;;(setq display-line-numbers 'relative)))
  (add-hook 'python-mode-hook 'python-ts-mode)
  (add-hook 'python-mode-hook 'pet-mode -10)
  (add-hook 'python-mode-hook 'lsp-mode t)
  (add-hook 'python-mode-hook 'python-black-on-save-mode)
  (add-hook 'python-mode-hook (lambda ()
				(setq display-line-numbers 'absolute)))

  ;;Ocaml Time
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  ;; (add-hook 'merlin-mode-hook #'company-mode) ;
  (setq merlin-error-after-save nil)
  ;; End Ocaml Time


  ;; Kotlin Time
  (add-hook 'kotlin-mode-hook #'lsp-deferred)
  (add-hook 'python-mode-hook #'company-mode)
  ;; End Kotlin Time


  ;;ts time
  (add-hook 'python-mode-hook (lambda() (company-mode 0)))
  (add-hook 'after-init-hook #'global-prettier-mode)
  (add-hook 'typescript-mode #'prettier-mode)

  ;; Terraform time
  ;;(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
  ;; End terraform



  ;; Yaml Time
  (add-hook 'yaml-mode-hook #'lsp-deferred))
  ;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
;;(add-hook 'yaml-mode-hook 'display-line-numbers-mode))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(when (daemonp)
  (exec-path-from-shell-initialize))

(defun configure ()
  "Execute all the config FNS."
  (requires)
  (packages)
  (setqs)
  (keymaps)
  ;; ;; (company)				;  (bootstrap)
  (theming)
  (defvar bootstrap-version)
  (let ((bootstrap-file
	 (expand-file-name
          "straight/repos/straight.el/bootstrap.el"
          (or (bound-and-true-p straight-base-dir)
              user-emacs-directory)))
	(bootstrap-version 7))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
	(goto-char (point-max))
	(eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))
  (straight-use-package '(myron-themes :host github :repo "neeasade/myron-themes" :files ("*.el" "themes/*.el")))
  (prog-time))

(configure)
(provide 'init)

(defun dump-rules ()
  (interactive)
  (shell-command-to-string
   "pg_dump -h localhost --port 5434--column-inserts --data-only -U sinacofi --format=tar migration_msg > $(date '+%Y-%m-%d').msg.history.dump.tar"))



;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "fc916e571929d8ddbe826ea1952f2d6ddcda5c5f7dde5347d5f5d213f97bcf68" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "b93039071f490613499b76c237c2624ae67a9aafbc717da9b4d81f456344e56e" "882d6a5981fd85d9f987d31623e25e69b8d5635a53ab442f1a51e7c252790320" "dbe20eb3746c236078b5e3461bdaf7c0c18abc81563a171949abbf043cdab5af" "50fc480e40b2b03e4fe9e83f5ceba3fa4d8bc31dac95fa11e73a938da56d7e4c" "0cc70543214e5133e0eb479a01e57128a4f3e62195ca9073dffe90c8a57519e1" "6f177b9a2579197e650918c8e53440997063b543fc854763e3597b5a4c33860d" "4f03e70554a58349740973c69e73aefd8ce761a77b22a9dc52a19e708532084a" "a60b04e5c0fef30209f9576f04651938472b57cb1dae0375d80a53a78f515f69" "afde6368be6868e8e3dd53fad1ac51223d5484f9e6836496e7987802c9a9663d" "38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "9418c89910764d9a727e57106839f593efc240984c1294bda46cf917bc17bc47" "7a3f3282c4ce1edc3387deb6f72ed31026ab7dfdf4c25ddcfad9008d2a5a5574" "4d16802de4686030ed8f30b5a844713d68edec9cc07322bef54493d15e68d8cd" "e9aa348abd3713a75f2c5ba279aa581b1c6ec187ebefbfa33373083ff8004c7c" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "74e2ed63173b47d6dc9a82a9a8a6a9048d89760df18bc7033c5f91ff4d083e37" "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b" "06ed754b259cb54c30c658502f843937ff19f8b53597ac28577ec33bb084fa52" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "89d9dc6f4e9a024737fb8840259c5dd0a140fd440f5ed17b596be43a05d62e67" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "680f62b751481cc5b5bp44aeab824e5683cf13792c006aeba1c25ce2d89826426" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" default))
 '(package-selected-packages
   '(mise mise-in-place rainbow-csv-mode lsp-metals scala-mode vterm load-env-vars indent-guide csv-mode go-dlv dap-mode treemacs speedbar-git-respect scss-mode typescript-mode toml-mode yaml-mode crystal-mode lsp-pyright projectile magit company yasnippet lsp-ui lsp-mode go-mode doom-themes))
 '(safe-local-variable-values
   '((sql-postgres-login-params
      '((user :default "sinacofi")
	(database :default "message2")
	(server :default "34.135.68.241")
	(port :default 5432))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(put 'set-goal-column 'disabled nil)
