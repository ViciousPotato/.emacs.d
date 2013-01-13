;; make it cleaner
(when (functionp 'tool-bar-mode)
	(tool-bar-mode -1))
(tool-bar-mode 0)
(setq inhibit-statrtup-message t)
(setq initial-scratch-message nil)

;; space
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; no backup
(setq backup-enable-predicate
      (lambda (name) nil))

;; encoding
(prefer-coding-system 'utf-8)

;; theme
(set-default-font "Monaco-10")
(setq-default line-spacing 3)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'bubbleberry t)

;; plugins
(add-to-list 'load-path "~/.emacs.d/plugins")
;; Needed by powerline
(require 'cl)
(require 'powerline)

;; proxy
(setq url-using-proxy t)
(setq url-proxy-services  '(("http" . "proxy.fudan.edu.cn:8080")))

;; Emacs Starter Kit
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


;; ecb
(setq stack-trace-on-error nil)
(setq ecb-tip-of-the-day nil)
(require 'ecb)
(ecb-activate)

;; Language modes
;; Jade mode
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
