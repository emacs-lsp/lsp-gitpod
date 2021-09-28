(package-initialize)

(require 'lsp-mode)

(require 'dap-cpptools)
(dap-cpptools-setup)



(defun my/wait-for-installation (server-id)
  (lsp-install-server nil server-id)

  (while (-filter #'lsp--client-download-in-progress? (ht-values lsp-clients))
    (message "Waiting server installation for %s"
             (-map #'lsp--client-server-id
                   (-filter #'lsp--client-download-in-progress?
                            (ht-values lsp-clients))))
    (accept-process-output nil 1)))

(my/wait-for-installation 'jdtls)
(my/wait-for-installation 'eslint)
(my/wait-for-installation 'ts-ls)
(my/wait-for-installation 'json-ls)
(my/wait-for-installation 'xmlls)
(my/wait-for-installation 'rust-analyzer)
(my/wait-for-installation 'html-ls)
(my/wait-for-installation 'css-ls)
(my/wait-for-installation 'clojure-lsp)

(require 'dap-node)
(dap-node-setup)
