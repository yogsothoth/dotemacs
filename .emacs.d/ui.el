;; user interface configuration

;; User interface
;; No menu, bar, etc.
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; No startup screen
(setq inhibit-splash-screen t)

;; No CTRL-Z
(global-unset-key (kbd "C-z"))

;; Colour themes
;; Use the replace-colorthemes package
;; from https://github.com/emacs-jp/replace-colorthemes
;; Not necessary anymore? Many themes are straight in MELPA these days
(add-to-list 'custom-theme-load-path
 	     (file-name-as-directory "~/replace-colorthemes"))

(load-theme 'darktooth t t)
(enable-theme 'darktooth)

;; font
(set-face-attribute 'default nil :font "Fantasque Sans Mono" :height 120)

;; display time
(display-time-mode 1)
(setq display-time-format "%d %B %Y %H:%M")

;; Keep the cursor blinking forever
(setq blink-cursor-blinks 0)

;; beacon
(beacon-mode 1)

;; Nice fonts on Windows
;; Taken from https://github.com/dertuxmalwieder/My-Emacs-config
(if (eq system-type 'windows-nt)
  (progn
    ;; On Windows, I want a neater default font at least
    (set-face-attribute 'default nil :family "Consolas" :height 100)
    (w32-send-sys-command 61488))) ; do this after setting the font (will resize the window!)

;; increase / decrease text size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; highlight the current line
(require 'hl-line)
(require 'color)
;;(defface 'hl-line '((t (:background "slateblue")))
;; (set-face-attribute hl-line-face
;; 		    nil
;; 		    :background "slateblue"
;; 		    :foreground "yellow")
; turn it on for all modes by default
(global-hl-line-mode t)

;; anzu
;; put here for lack of a better place
;; configuration taken from pragmaticemacs.com/emacs/prettier-text-replacement-with-anzu/
(require 'anzu)
(global-anzu-mode)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; display tooltips in the echo area
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; winner-mode
(winner-mode t)

;; backup files in a single directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; volume control
(define-key global-map (kbd "<f2>") '(shell-command "mixer vol -10:-10"))
(define-key global-map (kbd "<f3>") '(shell-command "mixer vol +10:+10"))


(require 'buffer-move)
