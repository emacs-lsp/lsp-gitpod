(package-initialize)

(require 'lsp-mode)

(lsp-install-server nil 'ts-ls)
(lsp-install-server nil 'eslint)


(while (-filter #'lsp--client-download-in-progress? (ht-values lsp-clients))
  (message "Waiting server installation for %s"
           (-map #'lsp--client-server-id (-filter #'lsp--client-download-in-progress? (ht-values lsp-clients))))
  (accept-process-output nil 1))
