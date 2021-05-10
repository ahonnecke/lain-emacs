;;; init-quad-screen.el ---
;;
;; Filename: init-quad-screen.el
;; Description:
;; Author: Mingde (Matthew) Zeng
;; Maintainer:
;; Copyright (C) 2019 Mingde (Matthew) Zeng
;; Created: Sun Sep 13 12:11:40 2020 (-0600)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 6
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

(fset 'triple-screen
      (lambda (&optional arg)
        "Split the screen into three screens"
        (interactive "p")
        (kmacro-exec-ring-item
         (quote ([?\C-x ?1 ?\C-x ?3 ?\C-x ?3 ?\C-x ?+ ] 0 "%d")) arg)))

(fset 'quad-screen
      (lambda (&optional arg)
        "Split the screen into four buffers"
        (interactive "p")
        (kmacro-exec-ring-item
         (quote ([?\C-x ?1 ?\C-x ?3 ?\C-x ?3 ?\C-x ?3 ?\C-x ?+ ] 0 "%d")) arg)))

(triple-screen)

(global-set-key (kbd "C-c +") 'triple-screen)

(provide 'init-quad-screen)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-quad-screen.el ends here
