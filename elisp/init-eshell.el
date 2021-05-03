;;; init-eshell.el ---
;;
;; Filename: init-eshell.el
;; Description:
;; Author: Ashton
;; Maintainer:
;; Copyright (C) 2019 Mingde (Matthew) Zeng
;; Created: Tue Sep 15 13:19:09 2020 (-0600)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 12
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

(use-package eshell
  :init
  (setq ;; eshell-buffer-shorthand t ...  Can't see Bug#19391
        eshell-scroll-to-bottom-on-input 'all
        eshell-error-if-no-glob t
        eshell-hist-ignoredups t
        eshell-save-history-on-exit t
        eshell-prefer-lisp-functions nil
        eshell-destroy-buffer-when-process-dies t))

;; Did not seem to work --ashton Mon 07 Dec 2020 10:33:00 AM MST
;; (defun eshell-load-bash-aliases ()
;;        "Reads bash aliases from Bash and inserts
;; them into the list of eshell aliases."
;;        (interactive)
;;        (progn
;;                (message "Parsing aliases")
;;                (shell-command "alias" "bash-aliases" "bash-errors")
;;                (switch-to-buffer "bash-aliases")
;;                (replace-string "alias " "")
;;                (goto-char 1)
;;                (replace-string "='" " ")
;;                (goto-char 1)
;;                (replace-string "'\n" "\n")
;;                (goto-char 1)
;;                (let ((alias-name) (command-string) (alias-list))
;;                     (while (not (eobp))
;;                        (while (not (char-equal (char-after) 32))
;;                               (forward-char 1))
;;                            (setq alias-name
;;                                    (buffer-substring-no-properties (line-beginning-position) (point)))
;;                            (forward-char 1)
;;                            (setq command-string
;;                                    (buffer-substring-no-properties (point) (line-end-position)))
;;                            (setq alias-list (cons (list alias-name command-string) alias-list))
;;                            (forward-line 1))
;;                     (setq eshell-command-aliases-list alias-list))
;;            (if (get-buffer "bash-aliases")(kill-buffer "bash-aliases"))
;;            (if (get-buffer "bash-errors")(kill-buffer "bash-errors"))))

;; (add-hook 'eshell-mode-hook 'eshell-load-bash-aliases)

(defun eshell-there (host)
  "Creates an eshell session that uses Tramp to automatically
connect to a remote system, HOST.  The hostname can be either the
IP address, or FQDN, and can specify the user account, as in
root@blah.com. HOST can also be a complete Tramp reference."
  (interactive "sHost: ")

  (let* ((default-directory
           (cond
            ((string-match-p "^/" host) host)

            ((string-match-p (ha/eshell-host-regexp 'full) host)
             (string-match (ha/eshell-host-regexp 'full) host) ;; Why!?
             (let* ((user1 (match-string 2 host))
                    (host1 (match-string 3 host))
                    (user2 (match-string 6 host))
                    (host2 (match-string 7 host)))
               (if host1
                   (ha/eshell-host->tramp user1 host1)
                 (ha/eshell-host->tramp user2 host2))))

            (t (format "/%s:" host)))))
    (eshell-here)))

(defun eshell-next-prompt (n)
  "Move to end of Nth next prompt in the buffer. See `eshell-prompt-regexp'."
  (interactive "p")
  (re-search-forward eshell-prompt-regexp nil t n)
  (when eshell-highlight-prompt
    (while (not (get-text-property (line-beginning-position) 'read-only) )
      (re-search-forward eshell-prompt-regexp nil t n)))
  (eshell-skip-prompt))

(defun eshell-previous-prompt (n)
  "Move to end of Nth previous prompt in the buffer. See `eshell-prompt-regexp'."
  (interactive "p")
  (backward-char)
  (eshell-next-prompt (- n)))

(defun eshell-insert-history ()
  "Displays the eshell history to select and insert back into your eshell."
  (interactive)
  (insert (ido-completing-read "Eshell history: "
                               (delete-dups
                                (ring-elements eshell-history-ring)))))

(add-hook 'eshell-mode-hook (lambda ()
    (define-key eshell-mode-map (kbd "M-S-P") 'eshell-previous-prompt)
    (define-key eshell-mode-map (kbd "M-S-N") 'eshell-next-prompt)
    (define-key eshell-mode-map (kbd "M-r") 'eshell-insert-history)))

(defun eshell/f (filename &optional dir try-count)
  "Searches for files matching FILENAME in either DIR or the
current directory. Just a typical wrapper around the standard
`find' executable.

Since any wildcards in FILENAME need to be escaped, this wraps the shell command.

If not results were found, it calls the `find' executable up to
two more times, wrapping the FILENAME pattern in wildcat
matches. This seems to be more helpful to me."
  (let* ((cmd (concat
               (executable-find "find")
               " " (or dir ".")
               "      -not -path '*/.git*'"
               " -and -not -path '*node_modules*'"
               " -and -not -path '*classes*'"
               " -and "
               " -type f -and "
               "-iname '" filename "'"))
         (results (shell-command-to-string cmd)))

    (if (not (s-blank-str? results))
        results
      (cond
       ((or (null try-count) (= 0 try-count))
        (eshell/f (concat filename "*") dir 1))
       ((or (null try-count) (= 1 try-count))
        (eshell/f (concat "*" filename) dir 2))
       (t "")))))

(defun eshell/ef (filename &optional dir)
  "Searches for the first matching filename and loads it into a
file to edit."
  (let* ((files (eshell/f filename dir))
         (file (car (s-split "\n" files))))
    (find-file file)))

(provide 'init-eshell)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-eshell.el ends here
