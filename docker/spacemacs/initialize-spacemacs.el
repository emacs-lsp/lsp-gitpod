(setq package-native-compile t)
(setq native-comp-deferred-compilation nil)
(setq native-comp-async-jobs-number 8)

(advice-add
 'native-compile-async :before
 (lambda (files &optional recursively load selector)
   (message "XXX: byte compiling %s, queue size = %s" files (length comp-files-queue))))

(load "/home/gitpod/.emacs.d/init.el")

(message "Native compilation to finish. %s" (length comp-files-queue))

(while comp-files-queue
  (message "Waiting for native compilation to finish. %s" (length comp-files-queue))
  (accept-process-output nil 5))
