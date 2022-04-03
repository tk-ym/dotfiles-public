;; 以下のコマンドでterminfoを生成しておく
(require 'multi-term)
(setq multi-term-program shell-file-name)

;; shellにとられないキーバインド
(add-to-list 'term-unbind-key-list '"M-x")
(add-to-list 'term-unbind-key-list '"C-z")

;; Mac
(setq local-config-system 'utf-8)

;; shell-command
(global-set-key "\M-s" 'multi-term-next)

;; term に奪われたくないキー
(add-to-list 'term-unbind-key-list '"C-o")

;; term 内での文字削除、ペーストを有効にする
(add-hook 'term-mode-hook
          '(lambda ()
             (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
             (define-key term-raw-map (kbd "C-y") 'term-paste)
             ))
