;; make it cleaner
(tool-bar-mode 0)
(setq inhibit-statrtup-message t)
(setq initial-scratch-message nil)

;; space

;; no backup
(setq backup-enable-predicate
      (lambda (name) nil))

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'bubbleberry t)

;; plugins
(add-to-list 'load-path "~/.emacs.d/plugins")
;; Needed by powerline
(require 'cl)
(require 'powerline)
