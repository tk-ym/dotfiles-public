(require 'org-install)
(require 'org-agenda)

;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; 画面端で改行する
(setq org-startup-truncated nil)
;; 見出しを畳まない
(setq org-startup-folded nil)
;; returnでリンクを飛ぶ
(setq org-return-follows-link t)
;; 画像をインラインで表示
(setq org-startup-with-inline-images t)
;; org-modeのルートディレクトリ
(setq org-directory "~/Documents/Org/")
;; agenda表示の対象ファイル
(setq org-agenda-files (list org-directory))
;; org-modeのデフォルトの書き込み先
(setq org-default-notes-file (concat org-directory "agenda.org"))
;; org-modeのテンプレート
(setq org-capture-templates 
  '(
    ("D" "Daily" entry (file+headline (concat org-directory "dailies.org") "Daily") "* %?\n   %T")
    ("t" "Todo"  entry (file+headline (concat org-directory "todos.org")  "Todo")  "* TODO %?\n   %T")
    ("N" "Note" entry (file+headline (concat org-directory "notes.org") "Note")  "* %?\n   %a\n   %T")
  ))
;; TODOの状態
(setq org-todo-keywords
      '((sequence "TODO" "Doing" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
;; DONEの時間を記録
(setq org-log-done 'time)
;; タグの色を変える
(setq org-tag-faces
      '(("Doing" :foreground "#FF0000")))

;; アジェンダは7日分を表示
(setq org-agenda-span 7)
;; 時間表示が 1 桁の時, 0 をつける
(setq org-agenda-time-leading-zero t)
;; セレクションメニューから状態の変更を行えるようにする
(setq org-use-fast-todo-selection t)
