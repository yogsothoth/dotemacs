;; user interface configuration

;; User interface
;; No menu, bar, etc.
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; No startup screen
(setq inhibit-splash-screen t)

;; Colour themes
;; Use the replace-colorthemes package
;; from https://github.com/emacs-jp/replace-colorthemes
(add-to-list 'custom-theme-load-path
	     (file-name-as-directory "~/replace-colorthemes"))

(add-to-list 'custom-theme-load-path
	     (file-name-as-directory "~/emacs-faff-theme"))

(load-theme 'dark-blue2 t t)
(enable-theme 'dark-blue2)

;; font size 10pt
(set-face-attribute ' default nil :height 100)

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

;; taken from http://emacs-fu.blogspot.fr/2008/12/highlighting-current-line.html
;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
;; (defface hl-line '((t (:background "gainsboro")))

(defface hl-line '((t (:background "grey16")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
; turn it on for all modes by default
(global-hl-line-mode t)

;; anzu
;; put here for lack of a better place
;; configuration taken from pragmaticemacs.com/emacs/prettier-text-replacement-with-anzu/
(require 'anzu)
(global-anzu-mode)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; don't maximise on startup
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (require 'maxframe)
;; (add-hook 'window-setup-hook 'maximize-frame t)

;; display tooltips in the echo area
(tooltip-mode -1)
(setq tooltip-use-echo-area t)
