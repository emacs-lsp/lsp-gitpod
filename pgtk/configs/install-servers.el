(package-initialize)

(require 'lsp-mode)

(lsp-install-server nil 'ts-ls)
(lsp-install-server nil 'eslint)
(lsp-install-server nil 'json-ls)
(lsp-install-server nil 'xmlls)
(lsp-install-server nil 'html-ls)
(lsp-install-server nil 'rust-analyzer)
(lsp-install-server nil 'css-ls)
(lsp-install-server nil 'clojure-lsp)
(lsp-install-server nil 'jdtls)

(while (-filter #'lsp--client-download-in-progress? (ht-values lsp-clients))
  (message "Waiting server installation for %s"
           (-map #'lsp--client-server-id
                 (-filter #'lsp--client-download-in-progress?
                          (ht-values lsp-clients))))
  (accept-process-output nil 1))
