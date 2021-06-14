(package-initialize)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'doom-molokai t)
(helm-mode)
(helm-icons-enable)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)
(add-hook 'prog-mode-hook #'lsp)

(with-eval-after-load 'treemacs-icons
  (treemacs-resize-icons 15))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1

      ;; lock file will kill `npm start'
      create-lockfiles nil
      inhibit-splash-screen t
      inhibit-startup-message t

      ;; avoid resizing of popup while typing.
      company-tooltip-maximum-width 60
      company-tooltip-minimum-width 60

      ;; less noise
      company-frontends '(company-pseudo-tooltip-frontend)

      ;; less noise
      lsp-completion-show-detail nil
      lsp-completion-show-kind nil

      helm-buffer-details-flag nil

      lsp-idle-delay 0.1
      lsp-headerline-breadcrumb-enable t
      lsp-signature-function #'lsp-signature-posframe
      company-quickhelp-delay 0.1)

(with-eval-after-load 'dired
  (treemacs-icons-dired-mode))

(with-eval-after-load 'lsp-mode
  (require 'dap-chrome)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (add-hook 'dired-mode-hook #'lsp-dired-mode)
  (yas-global-mode)
  (company-quickhelp-mode))
