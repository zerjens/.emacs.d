;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Custom Settings.
;;    Want everything here to load it isn't already installed.
;;    Since '~/emacs.d/elpa' is part of the gitignore, this
;;    will cause all these to download on the first start up.
;;    Further customizations under ui.el and ux.el won't work
;;    correctly otherwise.  Custom color themes are managed
;;    in ui.el, not here.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar custom-packages
  '(exec-path-from-shell     ; Copy env from shell

    dash                     ; adds a lot of sugar to elisp :)

    dash-functional          ; combinators, e.g. juxt, partial, & compose.

    smex                     ; M-x enhancements

    magit                    ; Git Integration

    projectile               ; another banger from bbatsov

    paradox                  ; improves package list

    flycheck

    company

    helm

    paredit                  ; balanced parens.

    rainbow-mode             ; balanced parens w/ style.

    fold-this                ; s-expr code folding.

    slime                    ; still good for Racket/Scheme.

    clojure-mode

    cider

    haskell-mode

    erlang

    prolog

    idris-mode

    swift-mode

    rust-mode

    kotlin-mode

    julia-mode

    jedi                     ; Python

    ess))                    ; R/stats

;; Ensure everything above is installed.
(dolist (p custom-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Immediately start using dash/dash-functional
(require 'dash)
