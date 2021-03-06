;;; init-magit.el --- -*- lexical-binding: t -*-
;;
;; Filename: init-magit.el
;; Description: Initialize Magit
;; Author: Mingde (Matthew) Zeng
;; Copyright (C) 2019 Mingde (Matthew) Zeng
;; Created: Fri Mar 15 08:40:27 2019 (-0400)
;; Version: 3.0
;; URL: https://github.com/MatthewZMD/.emacs.d
;; Keywords: M-EMACS .emacs.d magit
;; Compatibility: emacs-version >= 26.1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This initializes magit
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

;; MagitPac
(use-package magit
  :if (executable-find "git")
  :bind
  (("C-x g" . magit-status)
   (:map magit-status-mode-map
         ("M-RET" . magit-diff-visit-file-other-window)))
  :config
  (defun magit-log-follow-current-file ()
    "A wrapper around `magit-log-buffer-file' with `--follow' argument."
    (interactive)
    (magit-log-buffer-file t))

  (defun auto-display-magit-process-buffer (&rest args)
    "Automatically display the process buffer when it is updated."
    (let ((magit-display-buffer-noselect t))
      (magit-process-buffer)))

  (define-key magit-process-mode-map  (kbd "<return>") 'find-file-at-point-with-line)
  (advice-add 'magit-process-set-mode-line-error-status :before #'auto-display-magit-process-buffer)
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
  (setq magit-refresh-status-buffer nil)
  )

(defun spre-commit ()
  "runs the git pre-commit hooks"
  (interactive)
  (start-process
   "pre-commit"
   "pre-commit-buffer"
   "pre-commit run --all-files"
   ))

(global-set-key (kbd "H-h") 'browse-at-remote)
(setq ghub-use-workaround-for-emacs-bug 'force)

;; -MagitPac

(provide 'init-magit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-magit.el ends here
