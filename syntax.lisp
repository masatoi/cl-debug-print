(in-package #:cl-user)

(syntax:define-package-syntax :debug-print
  (:merge :standard)
  (:dispatch-macro-char #\# #\> #'cl-debug-print:debug-print-reader))
