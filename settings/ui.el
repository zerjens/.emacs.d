;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; UI Customiations:
;;    * size
;;    * layout
;;    * themes
;;    * point
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This font height seems to be right on every monitor I've used.
(set-face-attribute 'default nil :height 110)

;; This really just fits my 27" LG at home...
;; Need to test on other hardware, autosize from x-display-pixel-width?
(setq initial-frame-alist
      '((top    . 60)
        (left   . 60)
        (width  . 180)
        (height . 50)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Layout/Splash - Remove tool/menu bar, start up display, etc.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Get rid of distracting frame icons/scroll-bar etc.
(when (fboundp 'tool-bar-mode)     (tool-bar-mode    -1))
(when (fboundp 'menu-bar-mode)     (menu-bar-mode    -1))
(when (fboundp 'scroll-bar-mode)   (scroll-bar-mode  -1))
(when (fboundp 'global-linum-mode) (global-linum-mode 1))

;; Clean start up into the scratch buffer.
(setq inhibit-startup-message t)
(setq inhibit-splash-screen   t)

;; Utterly filthy and uncivilized.
(setq-default truncate-lines t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Themes - Somewhat borrowed from https://www.emacswiki.org/emacs/CustomThemes
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load Custom Themese
(setq custom-safe-themes t)

;; Stuart Sierras 'threading-with-style'
(let ((themes-dir "~/.emacs.d/settings/themes/"))
  (->> (directory-files themes-dir)
       (-drop 3)
       (-filter 'file-directory-p)
       (--map (concat themes-dir it))
       (--map (add-to-list 'custom-theme-load-path it))))

(load-theme 'noctilux t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Point settings:
;;    The longer you look at the monitor the more distracting this gets.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(blink-cursor-mode 0)
