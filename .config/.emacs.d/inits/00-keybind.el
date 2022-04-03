(global-set-key "\C-x\C-x" 'eval-buffer)                 ;; 設定後の変更
(global-set-key "\C-c\g" 'goto-line)                     ;; goto-line
(global-set-key "\C-h" 'delete-backward-char)            ;; backspace

(global-set-key "\C-c\C-r" 'window-resizer)              ;; window-resizerの起動、コマンドはhjklでサイズ変更

;; org-mode キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-iswitchb)

;; undo-treeキーバインドの設定
(global-set-key (kbd "M-/") 'undo-tree-redo)

