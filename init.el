;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs Starting Point.
;;    This file focuses on loading packages, finding
;;    other settings files, and managing customizations:
;;    https://www.gnu.org/software/emacs/manual/html_node/elisp/Starting-Up.html
;;
;; Package Management:
;;    https://www.gnu.org/software/emacs/manual/html_node/emacs/Packages.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; First check that running version of emacs is compatible with all libraries.
(let ((min-version "25.0")
      (err-msg "Emacs Version >= 25 Required, %s Found"))
  (when (version< emacs-version min-version)
    (error err-msg emacs-version)))

;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Packages.html
(require 'package)

;; Use HTTPS - might need to setup proxy at work?
(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
        ("marmalade"    . "https://marmalade-repo.org/packages/") ; cert expired?
        ("melpa"        . "https://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org"          . "https://orgmode.org/elpa/")))

;; Activate package archives, this will prompt for gnugp keys only once.
(package-initialize)

;; Fetch available packages
(unless package-archive-contents
  (package-refresh-contents))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Customizations:
;;
;;    UI and UX Settings, Programming Language Mode Hooks.
;;    https://www.emacswiki.org/emacs/LoadPath
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Include directories under '~/.emacs.d/settings' e.g. 'ui.el' & 'themes'.
(add-to-list 'load-path "~/.emacs.d/settings")

;; gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
;; Always an eyesore to see 'custom-set-variables' appended to init.el...
(load "custom.el")

(load "ux.el")

(load "ui.el")
