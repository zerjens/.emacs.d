;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs Lisp Specific Settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'enable-paredit-mode "paredit" "Paredit = Balanced Parenthesis")

(add-hook 'lisp-mode-hook             #'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook       'turn-on-eldoc-mode)

(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             'turn-on-eldoc-mode)

(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
