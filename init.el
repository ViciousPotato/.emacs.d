;; make UI cleaner
(when (functionp 'tool-bar-mode)
	(tool-bar-mode -1))
(setq inhibit-statrtup-message t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)

;; indentation
(define-key global-map (kbd "RET") 'newline-and-indent)

;; line number
(global-linum-mode 1)

;; space
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; no backup
(setq backup-enable-predicate
      (lambda (name) nil))
(setq make-backup-files nil)
(setq auto-save-default nil)

;; encoding
(prefer-coding-system 'utf-8)

;; font & theme
(if (eq system-type 'darwin)
    (set-default-font "Inconsolata-15")
    (if (eq system-type 'gnu/linux)
        (set-default-font "Ubuntu Mono-12")
      (set-default-font "Inconsolata-10.5")))
(setq-default line-spacing 2)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; plugins
(add-to-list 'load-path "~/.emacs.d/plugins")
;; Needed by powerline
;;(require 'cl)
;;(require 'powerline)

;; proxy
;; (setq url-using-proxy t)
;; (setq url-proxy-services  '(("http" . "wwwproxy.ms.com:8080")))
;;
;; Emacs Starter Kit
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (unless package-archive-contents (package-refresh-contents))
(package-initialize)

(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-solarized-dark)

;; Tramp
(require 'tramp)
(setq tramp-auto-save-directory "C:\\MSDE\\honglinz\\tmp")
(setq tramp-default-method "plink")

;; smooth scrolling
(require 'smooth-scrolling)

;; delete when typing
(delete-selection-mode 1)

;; ecb
(setq stack-trace-on-error nil)
(setq ecb-tip-of-the-day nil)
(require 'ecb)
;;(ecb-activate)

;; Language modes
;; Jade mode
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; Fsharp-mode
(require 'fsharp-mode)
(setq inferior-fsharp-program "\"c:\\Program Files\\Microsoft F#\\v4.0\\Fsi.exe\"")
(setq fsharp-compiler "\"c:\\Program Files\\Microsoft F#\\v4.0\\Fsc.exe\"")

;; Java stuff
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode t)))

;; Python stuff
(add-hook 'python-mode-hook '(lambda () 
                               (setq python-indent-offset 2)))

;; OCaml
 (setq auto-mode-alist
       (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist)) 
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)

;; -- merlin setup ---------------------------------------

(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)

;; Enable Merlin for ML buffers
(add-hook 'tuareg-mode-hook 'merlin-mode)

;; So you can do it on a mac, where `C-<up>` and `C-<down>` are used
;; by spaces.
(define-key merlin-mode-map
  (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
(define-key merlin-mode-map
  (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
(set-face-background 'merlin-type-face "#88FF44")

;;-- enable auto-complete -------------------------------
;;Not required, but useful along with merlin-mode
(require 'auto-complete)
(add-hook 'tuareg-mode-hook 'auto-complete-mode)

;; Set PATH, MANPATH for OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

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
