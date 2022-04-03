;; c-defs.elの設定
(require 'cc-defs)

;; eldoc-extension
(when (require 'eldoc-extension nil t)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (setq eldoc-idle-delay 0)
  ;;(setq eldoc-echo-area-use-multiline-p t)
  (setq eldoc-minor-mode-string "")
)

; c-eldoc.elの設定
;; c-eldocモードの設定
(when (require 'c-eldoc nil t)
  (add-hook 'c-mode-hook
            (lambda ()
              (set (make-local-variable 'eldoc-idle-delay) 0.2)
              (set (make-local-variable 'eldoc-minor-mode-string) "")
              (c-turn-on-eldoc-mode)
              )))

(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
