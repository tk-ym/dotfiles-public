(when (require 'ivy nil t)

  (when (require 'ivy-hydra nil t)
    (setq ivy-read-action-function #'ivy-hydra-read-action))

  (setq ivy-use-virtual-buffers t)

  (when (setq enable-recursive-minibuffers t)
    (minibuffer-depth-indicate-mode 1)) ;; 何回層入ったかプロンプトに表示．

  (setq ivy-count-format "(%d/%d) ")
  
  (define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)

  (setq ivy-truncate-lines nil)
  (setq ivy-wrap t)
  (ivy-mode 1))


(when (require 'counsel nil t)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)

  (counsel-mode 1))

(when (require 'ivy-rich nil t)
  (ivy-rich-mode 1))


;; (when (require 'swiper nil t)
;;   (global-set-key (kbd "M-s M-s") 'swiper-thing-at-point))


(when (require 'ivy-dired-history nil t)
  (define-key dired-mode-map "," 'dired)
  (with-eval-after-load "session"
    (add-to-list 'session-globals-include 'ivy-dired-history-variable)))

;; ;; all-the-icons-ivy
;; (with-eval-after-load "ivy"
;;   (defun my-pre-prompt-function ()
;;     (if window-system
;;         (format "%s\n%s "
;;                 (make-string (frame-width) ?\x5F) ;; "__"
;;                 (all-the-icons-faicon "sort-amount-asc")) ;; ""
;;       (format "%s\n" (make-string (1- (frame-width)) ?\x2D))))
;;   (setq ivy-pre-prompt-function #'my-pre-prompt-function))

;; (when (require 'all-the-icons-ivy nil t)
;;   (dolist (command '(counsel-projectile-switch-project
;;                      counsel-ibuffer))
;;     (add-to-list 'all-the-icons-ivy-buffer-commands command))
;;   (all-the-icons-ivy-setup))

;; (with-eval-after-load "all-the-icons-ivy"
;;       (defvar my-tab-width tab-width)
;;       (defun my-tab-width-2 () (setq tab-width 2))
;;       (defun my-tab-width-1 () (setq tab-width 1))
;;       (defun my-tab-width-8 () (setq tab-width 8))
;;       (defun my-tab-width-original ()
;;         (setq tab-width my-tab-width))
;;       (add-hook 'minibuffer-setup-hook #'my-tab-width-2)
;;       (add-hook 'minibuffer-exit-hook #'my-tab-width-original))


;; (with-eval-after-load "ivy-posframe"
;;   (setq ivy-posframe-display-functions-alist
;;         '((counsel-M-x . ivy-posframe-display-at-point)
;;           (t           . ivy-posframe-display)))
;;   (ivy-posframe-mode 1))
