(require 'obsidian)
;; Location of obsidian vault
(setopt obsidian-directory "~/Works/Documents/my-vault")
;; Default location for new notes from `obsidian-capture'
(setopt obsidian-inbox-directory "02_notes")
;; Useful if you're going to be using wiki links
(setopt markdown-enable-wiki-links t)

;; These bindings are only suggestions; it's okay to use other bindings
;; Create note
(define-key obsidian-mode-map (kbd "C-c C-n") 'obsidian-capture)
;; If you prefer you can use `obsidian-insert-wikilink'
(define-key obsidian-mode-map (kbd "C-c C-l") 'obsidian-insert-link)
;; Open file pointed to by link at point
(define-key obsidian-mode-map (kbd "C-c C-o") 'obsidian-follow-link-at-point)
;; Open a note note from vault
(define-key obsidian-mode-map (kbd "C-c C-p") 'obsidian-jump)
;; Follow a backlink for the current file
(define-key obsidian-mode-map (kbd "C-c C-b") 'obsidian-backlink-jump)

;; Activate obsidian mode and backlinks mode
(global-obsidian-mode t)
(obsidian-backlinks-mode t)
