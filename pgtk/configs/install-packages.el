;; temporary
(setq native-comp-deferred-compilation nil)

(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-refresh-contents)

(package-install 'quelpa)
;; (setq package-native-compile t)


;; with plist enabled
(quelpa '(lsp-mode :repo "yyoncho/lsp-mode" :fetcher github :branch "perf2" :files ("*.el" "clients/*.el")))

;; with jsonc-mode
(quelpa '(json-mode :repo "kiennq/json-mode" :fetcher github))

(mapc #'package-install
      '(posframe yasnippet lsp-treemacs helm-lsp projectile hydra flycheck
                 company avy which-key helm-xref dap-mode doom-themes
                 company-quickhelp rust-mode php-mode scala-mode dart-mode
                 clojure-mode all-the-icons treemacs-icons-dired helm-icons
                 lsp-java lsp-dart lsp-metals lsp-ivy lsp-sourcekit
                 magit))

(all-the-icons-install-fonts t)

(while (not (zerop (comp-async-runnings)))
  (message "Waiting for native compilation to finish. %s" (comp-async-runnings))
  (accept-process-output nil 1))
