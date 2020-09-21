;;; init-black.el ---
;;
;; Filename: init-black.el
;; Description:
;; Author: Mingde (Matthew) Zeng
;; Maintainer:
;; Copyright (C) 2019 Mingde (Matthew) Zeng
;; Created: Mon Sep 14 13:12:57 2020 (-0600)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 14
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
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

(use-package blacken
    :after python
    :config
    (defun apply-black ()
      "run black on the current file and revert the buffer"
      (interactive)
      (shell-command
       (format "black %s"
               (shell-quote-argument (buffer-file-name))))
      (revert-buffer t t t))

    :bind
    (("C-c l" . blacken-buffer))
    )

(add-hook 'python-mode-hook 'blacken-mode)

;;@ TODO only apply to buffers in python mode

(provide 'init-black)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-black.el ends here
