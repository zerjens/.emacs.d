;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Settings for the Following:
;;   * IDO
;;   * SMEX
;;   * Projectile
;;   * Misc
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; IDO defaults
(ido-mode 1)
(setq ido-ubiquitous t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; SMEX Settings:
;;    Possible commands made filterable through 'M-x' extension
;;    http://www.emacswiki.org/emacs/Smex
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'smex)
(smex-initialize)

;; A file is created that tracks 
(setq smex-save-file (concat user-emacs-directory ".smex-items"))

;;
(global-set-key (kbd "M-x") 'smex)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Projectile - pick up where you left off in a project.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; projectile everywhere
(projectile-global-mode)

;; saved projectile work under these innocuously names dirs.
(setq projectile-project-search-path '("~/projects/" "~/projects_work/"))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Navigation extension
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Misc:
;;  * dash/dash-functional
;;  * copy shell env
;;  * C-x o navigation extension
;;  * Autosave/Lockfiles
;;  * Quiet (turn bell off)
;;  * s-exp folding
;;  * Hippie Expand
;;  * Apropos
;;  * Y/N shortcut
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'dash)                              ; Immediately start using dash &
(require 'dash-functional)                   ; dash-functional, used hereafter.

(exec-path-from-shell-initialize)

;; SO: "in-emacs-what-is-the-opposite-function-of-other-window-c-x-o"
(global-set-key (kbd "C-x O") 'previous-multiframe-window)

;; Don't want '#filename#' or 'filename~' littered all over the place. 
(setq auto-save-default nil)
(setq create-lockfiles  nil)
(setq make-backup-files nil)

;; Any balanced s-expression is foldable into elipsis, and then expanded.
(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

(setq ring-bell-function 'ignore)
(setq visible-bell nil)

;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)

(setq apropos-do-all t)

;; Just type 'y' or 'n' rather than the whole word.
(fset 'yes-or-no-p 'y-or-n-p)
