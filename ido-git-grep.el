;;; ido-git-grep.el --- Git grep with ido interface

;; Copyright (C) 2016 by Kazuya Gosho

;; Author: Kazuya Gosho <ketsume0211@gmail.com>
;; URL: https://github.com/acro5piano/ido-git-grep
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4"))

;;; Commentary:

;; ido-git-grep provides git grep within ido interface.

;;; Code:

(defun ido-git-grep (search-word)
  "Grep for SEARCH-WORD in the current git repository."
  (interactive "Mkeyword: ")
  (let* ((command (format "git grep -n %s" search-word))
         (search-result (split-string (shell-command-to-string command) "\n"))
         (user-input-line
          (split-string
           (ido-completing-read "git-grep: " search-result) ":")))
    (find-file (nth 0 user-input-line))
    (goto-char (point-min))
    (forward-line (1- (string-to-number (nth 1 user-input-line))))))

(provide 'ido-git-grep)

;;; ido-git-grep.el ends here
