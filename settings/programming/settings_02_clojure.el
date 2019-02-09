;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Clojure Mode Settings.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Include EDN files to 
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

(require 'clojure-mode-extra-font-locking)

(add-hook 'clojure-mode-hook    'enable-paredit-mode)
(add-hook 'clojure-mode-hook    'subword-mode)
(add-hook 'cider-mode-hook      'eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(setq cider-repl-history-file             "~/.emacs.d/.cider-history")
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-repl-wrap-history             t)
(setq cider-show-error-buffer             t)
(setq cider-auto-select-error-buffer      nil)
(setq cider-repl-display-help-banner      nil)
