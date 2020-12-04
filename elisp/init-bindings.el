;;; init-bindings.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-bindings.el
;; Description: Initialize Ace-Window
;; Author: Mingde (Matthew) Zeng
;; Copyright (C) 2019 Mingde (Matthew) Zeng
;; Created: Tue Apr 23 10:00:42 2019 (-0400)
;; Version: 3.0
;; URL: https://github.com/MatthewZMD/.emacs.d
;; Keywords: M-EMACS .emacs.d ace-window
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This initializes ace-window
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(use-package key-chord :ensure t)
(require 'key-chord)
(key-chord-mode 1)

;; (defun contextual:find-file ()
;;   (interactive)
;;   (call-interactively (if (projectile-project-p)
;;                           'projectile-find-file
;;                         'helm-find-files)))
;;(define-key global-map (kbd "C-x f") 'helm-find-files)

;;(define-key projectile-mode-map (kbd "H-p") 'projectile-command-map)
;;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; get back
(global-set-key (kbd "H-p p") 'projectile-switch-project)

(global-set-key (kbd "<C-next>") 'windmove-right)
(global-set-key (kbd "<C-prior>") 'windmove-left)

;;(define-key projectile-mode-map (kbd "C-x f") 'helm-find-files)
;;(define-key global-map (kbd "C-x C-f") 'contextual:find-file)
;; (define-key projectile-mode-map (kbd "M-r a") 'ag-regexp-project-at-point)
;; (define-key projectile-mode-map (kbd "M-r r") 'ag-project-regexp)

;; (global-set-key (kbd "C-c h") 'dash-at-point)
;; ;(global-set-key (kbd "C-M-d") 'dash-at-point)

;; ;;(setq switch-to-ag-buffer
;; ;;      [?\C-x ?b ?* ?a ?g ?  ?s ?e ?a ?r ?c ?h ?* return])
;; ;(define-key projectile-mode-map [?\s-c] 'switch-to-ag-buffer)
;; ;;(global-set-key (kbd "C-c p") 'switch-to-ag-buffer)

;; ;(global-set-key (kbd "M-<return>") 'hippie-expand)

(global-set-key (kbd "C-c c") 'comment-region)
;;(global-set-key (kbd "H-c") 'comment-region)

(global-set-key (kbd "M-<return>") 'hippie-expand)

;; Go to line number
(global-set-key (kbd "H-l") 'goto-line)

;; Go to visible line with home row keys
;;(global-set-key (kbd "H-l") 'avy-goto-line)

;;e
(global-set-key (kbd "C-c r") 'replace-string)
(global-set-key (kbd "C-c q") 'query-replace)

(global-set-key (kbd "H-s") 'swiper-thing-at-point)
(global-set-key (kbd "M-u") 'string-inflection-python-style-cycle)

(global-set-key (kbd "C-x c p") 'string-inflection-python-style-cycle)
(global-set-key (kbd "C-x c a") 'string-inflection-all-cycle)
(global-set-key (kbd "C-x c s") 'string-inflection-underscore)
(global-set-key (kbd "C-x c u") 'string-inflection-upcase)

(global-set-key (kbd "C-s") 'isearch-forward)

;; (key-chord-define-global ";j" 'avy-goto-char)

;;f
(global-set-key (kbd "s-f") 'forward-sexp)
(global-set-key (kbd "s-b") 'backward-sexp)

(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x C-k") 'kill-buffer)
(global-set-key (kbd "s-b") 'backward-sexp)

(global-set-key (kbd "H-y") 'ace-window)
(global-set-key (kbd "H-u") 'ace-swap-window)
;; (key-chord-define-global ";a" 'ace-window)
(key-chord-define-global ";s" 'ace-swap-window)

(key-chord-define-global ";u" 'undo)
(key-chord-define-global ";k" 'kill-buffer)
(key-chord-define-global "'." 'ace-jump-mode) ;; select characters to jump to
;;(key-chord-define-global "''" 'save-buffer)
(key-chord-define-global ";c" 'string-inflection-all-cycle)

(global-set-key (kbd "H-; .") 'end-of-buffer)
(global-set-key (kbd "H-; ,") 'beginning-of-buffer)

(global-set-key (kbd "H-.") 'end-of-buffer)
(global-set-key (kbd "H-,") 'beginning-of-buffer)

(global-unset-key (kbd "C-c d"))
;; (local-unset-key (kbd) "C-c d"
(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)

;;(global-set-key (kbd "M-o") (quote ace-window))
(define-key shell-mode-map (kbd "M-o") (quote ace-window))

(define-key shell-mode-map (kbd "C-x o") (quote ace-window))
(global-set-key (kbd "C-x o") (quote ace-window))

;;(global-set-key (kbd "H-o") (quote ace-window))

(global-set-key (kbd "H-r") 'crux-recentf-find-file)
(global-set-key (kbd "H-r") 'crux-recentf-find-file)
(global-set-key (kbd "H-j") 'crux-top-join-line)
(global-set-key (kbd "H-k") 'crux-kill-whole-line)
(global-set-key (kbd "H-m m") 'magit-status)
(global-set-key (kbd "H-m l") 'magit-log)
(global-set-key (kbd "H-m f") 'magit-log-buffer-file)
(global-set-key (kbd "H-m b") 'magit-blame)
(global-set-key (kbd "H-o") 'crux-smart-open-line-above)

(global-set-key (kbd "H-C-f") 'find-file)
(global-set-key (kbd "H-f") 'fzf)
(global-set-key (kbd "H-o") 'browse-url-at-point)

(global-set-key (kbd "C-w") 'kill-region)

;;(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "C-l") 'recenter-top-bottom)

(global-set-key (kbd "H-; l") 'flycheck-list-errors)

(global-set-key (kbd "C-;") 'er/expand-region)
;;(define-key flyspell-mode-map (kbd "C-;") 'er/expand-region)

(global-set-key (kbd "H-<right>") 'windmove-right)
(global-set-key (kbd "H-<left>") 'windmove-left)
(global-set-key (kbd "H-<up>") 'windmove-up)
(global-set-key (kbd "H-<down>") 'windmove-down)

;; C-c f is the prefix for all file related shortcuts, of which there is one so far
(global-set-key (kbd "C-c f r") 'rename-file-and-buffer)

(setq bidi-inhibit-bpa t)

(provide 'init-bindings)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-bindings.el ends here
