;; temporary
(setq native-comp-deferred-compilation t)

(package-initialize)

(setq package-archives '(("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("nongnu" . "http://elpa.nongnu.org/nongnu/")))

(package-refresh-contents)

(package-install 'quelpa)
(setq package-native-compile t)

(setq native-comp-async-jobs-number 8)
;; with jsonc-mode

(quelpa '(json-mode :repo "kiennq/json-mode" :fetcher github))

(mapc #'package-install
      '(posframe yasnippet lsp-treemacs helm-lsp projectile hydra flycheck
                 company avy which-key helm-xref dap-mode doom-themes
                 company-quickhelp rust-mode php-mode scala-mode dart-mode
                 clojure-mode all-the-icons treemacs-icons-dired helm-icons
                 lsp-java lsp-dart lsp-metals lsp-ivy lsp-sourcekit
                 magit page-break-lines helm-projectile typescript-mode
                 csharp-mode go-mode kotlin-mode))

(while (not (zerop (comp-async-runnings)))
  (message "Waiting for native compilation to finish. %s" (comp-async-runnings))
  (accept-process-output nil 1))
