;;--------------------------------------------------------------------------------
;; 基本設定
;;--------------------------------------------------------------------------------
(custom-set-variables
 '(auto-save-default nil)          ; 自動保存しない
 '(auto-save-list-file-name nil)   ; 自動保存ファイルの名前を記録しない
 '(auto-save-list-file-prefix nil) ; 自動保存ファイルリストを初期化しない
 '(case-fold-search nil)           ; 大文字小文字を区別
 '(delete-auto-save-files t)       ; 自動保存ファイルを削除
 '(inhibit-startup-screen t)       ; スタートアップ画面を非表示
 '(make-backup-files nil)          ; バックアップファイルを作成しない
 '(scroll-bar-mode nil)            ; スクロールバーなし
 '(transient-mark-mode t)          ; アクティブなリージョンをハイライト
 '(menu-bar-mode nil)              ; メニューバー非表示
 '(tool-bar-mode nil)              ; ツールバー非表示
)

;;--------------------------------------------------------------------------------
;; 常時起動モード
;;--------------------------------------------------------------------------------
(global-auto-revert-mode t) ;変更時自動再読み込み
(global-display-line-numbers-mode t)   ; 行番号表示
(global-hi-lock-mode t) ; Hi Lock
(set-language-environment 'Japanese) ; 言語を日本語にする
(prefer-coding-system 'utf-8) ; 極力UTF-8とする
(setq-default frame-title-format (format "%%b - emacs@%s" (system-name)));; タイトルバー: バッファ名 - emacs@コンピュータ名
(setq display-time-day-and-date t) ; 端末に時刻を表示
(display-time)
;; (set-frame-parameter nil 'fullscreen 'maximized) ; 起動時にウィンドウを最大化する

;; diff-hlの設定を追加
(global-diff-hl-mode t)
(global-diff-hl-show-hunk-mouse-mode t)

;;-----------------------------------------------------------------
;; 設定
;;----------------------------------------------------------------
;; 行番号を表示
(set-face-attribute 'line-number nil
                  :foreground "#800"
                  :height 0.8)

;; 列番号を表示
(column-number-mode 1)
;; 対応する括弧を光らせる
(show-paren-mode 1)
;; ウィンドウ内に収まらないときだけ括弧内も光らせる
(setq show-paren-style 'mixed)
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)
;; カーソルの位置が何行目かを表示する
(line-number-mode t)
;; 選択されたリージョンを色付きにしてわかりやすくする
(transient-mark-mode t)
;; yesかnoかではなく、yかnで答えられるようにする
(defalias 'yes-or-no-p 'y-or-n-p)

;; 行間
(setq-default line-spacing 1)

(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; カーソルがどの関数の中にあるかをモードラインに表示する
(which-function-mode 1)
;; 4桁文を予め確保する
(setq linum-format "%4d")
;; ￥で\を入力する
(define-key global-map [?\¥] [?\\])
;; 背景を透過させる
(set-frame-parameter nil 'alpha '(90 70))
;; バックアップファイルを作らない
(setq make-backup-file nil)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;--------------------------------------------------------------------------------
;; 対応する括弧をハイライト
;;--------------------------------------------------------------------------------
(show-paren-mode t)
(setq show-paren-delay 0)                              ; 表示までの秒数: 0秒
(setq show-paren-style 'expression)                    ; 括弧内もハイライト
;; (set-face-background 'show-paren-match-face nil)       ; 背景色: なし
;; (set-face-underline-p 'show-paren-match-face "yellow") ; 下線色: 黄

;;--------------------------------------------------------------------------------
;; 対応する記号を自動補完
;;--------------------------------------------------------------------------------

(require 'skeleton)
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?『 _ ?』))
(global-set-key (kbd "『") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?【 _ ?】))
(global-set-key (kbd "【") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?［ _ ?］))
(global-set-key (kbd "［") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?〔 _ ?〕))
(global-set-key (kbd "〔") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?〈 _ ?〉))
(global-set-key (kbd "〈") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?《 _ ?》))
(global-set-key (kbd "《") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?｛ _ ?｝))
(global-set-key (kbd "｛") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?「 _ ?」))
(global-set-key (kbd "「") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?（ _ ?）))
(global-set-key (kbd "（") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?‘ _ ’〕))
(global-set-key (kbd "‘") 'skeleton-pair-insert-maybe)
(add-to-list 'skeleton-pair-alist '(?“ _ ?”))
(global-set-key (kbd "“") 'skeleton-pair-insert-maybe)

;;--------------------------------------------------------------------------------
;; フレームサイズ変更
;;--------------------------------------------------------------------------------
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

;; ;;--------------------------------------------------------------------------------
;; ;;
;; ;;--------------------------------------------------------------------------------
;; ;; linum-mode をいじって Emacs を高速化
;; (setq linum-delay t)
;; (defadvice linum-schedule (around my-linum-schedule () activate)
;;   (run-with-idle-timer 0.2 nil #'linum-update-current))

