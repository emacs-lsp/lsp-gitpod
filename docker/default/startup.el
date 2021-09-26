;;; startup.el --- Common startup handling for lsp-mode gitpod configs  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Ivan Yonchovski

;; Author: Ivan Yonchovski <yyoncho@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

;; (setenv "ORG" "emacs-lsp")
;; (setenv "PROJECT" "lsp-gitpod")
;; (setenv "GITPOD_REPO_ROOT" "/tmp/")

(defvar magit-clone-set-remote.pushDefault)

(defun startup-handle-project-dir (directory)
  (find-file directory)
  (require 'lsp-mode)
  (if-let (workspaces (directory-files directory t ".*\.code-workspace" ))
      (progn
        (message "Loading %s" (car workspaces))
        (lsp-load-vscode-workspace (car workspaces)))
    (lsp-workspace-folders-add directory)))

(let* ((org (getenv "ORG"))
       (project (getenv "PROJECT"))
       (root (f-parent (getenv "GITPOD_REPO_ROOT")))
       (directory (expand-file-name project root)))
  (when (and org project)
    (require 'f)
    (if (f-exists-p directory)
        (progn
          (message "Project %s/%s is already cloned in %s" org project directory)
          (startup-handle-project-dir directory))
      (let ((magit-clone-set-remote.pushDefault t))
        (message "Cloning project %s/%s." org project)
        (magit-clone-regular (format "https://github.com/%s/%s" org project) root nil)
        (set-process-sentinel
         magit-this-process
         (lambda (process event)
           (when (memq (process-status process) '(exit signal))
             (let ((magit-process-raise-error t))
               (magit-process-sentinel process event)))
           (when (and (eq (process-status process) 'exit)
                      (= (process-exit-status process) 0))
             (let ((default-directory directory))
               (magit-remote-unset-head "origin")))
           (startup-handle-project-dir directory)))))))

(provide 'startup)
;;; startup.el ends here
