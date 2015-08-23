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

(load-theme 'dark-blue t t)
(enable-theme 'dark-blue)

;; Keep the cursor blinking forever
(setq blink-cursor-blinks 0)

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
