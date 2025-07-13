;; straight.el setting by myself
(let ((bootstrap-file
       (concat user-emacs-directory "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 3))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use-package
(straight-use-package 'use-package)

;; use-packageをstraight.elにフォールバックする
(setq straight-use-package-by-default t)

;; appearance
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'yascroll)

;; Coding
(straight-use-package 'yasnippet)
(straight-use-package 'obsidian)

;; File
(straight-use-package 'recentf-ext)

;; Settings
(straight-use-package 'ivy)
(straight-use-package 'ivy-posframe)
(straight-use-package 'ivy-hydra)
(straight-use-package 'ivy-dired-history)
(straight-use-package 'ivy-rich)
(straight-use-package 'all-the-icons-ivy)

(straight-use-package 'bind-key)
(straight-use-package 'dash)
(straight-use-package 'multi-term)
(straight-use-package 'direx)

(straight-use-package 'undo-tree)
(straight-use-package 'markdown-mode)
(straight-use-package 'yaml-mode)

;; init-loader
(use-package init-loader)
;;; ログはエラーが出た時のみ
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))

;; ~/.emacs.d/init配下のelファイルをすべてロードする
(init-loader-load "~/.emacs.d/inits")
