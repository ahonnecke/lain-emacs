;;; init-fzf.el ---
;;
;; Filename: init-fzf.el
;; Description:
;; Author: Ashton Honnecke
;; Maintainer:
;; Copyright (C) 2019 Mingde (Matthew) Zeng
;; Created: Sun Sep 13 11:27:12 2020 (-0600)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 13
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
;; (setq-local projectile-project-root "/home/ahonnecke/src/")

(use-package "fzf"
  :init (setenv "FZF_DEFAULT_COMMAND" "rg --files --no-ignore-vcs --hidden -g '!{.venv,.git,*cache*,node_modules,.aws-sam}'")
  )

(global-set-key (kbd "H-f") 'fzf-find-file)

(provide 'init-fzf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-fzf.el ends here
