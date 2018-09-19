(defpackage cl-debug-print
  (:use :cl :cl-syntax :named-readtables)
  (:export :debug-print :debug-print-reader :debug-print-syntax))
(in-package :cl-debug-print)

(defun debug-print (pre-exp exp)
  (format *standard-output* "~A => ~A~%" pre-exp exp)
  exp)

(defun debug-print-reader (stream char1 char2)
  (declare (ignore char1 char2))
  (let ((read-data (read stream t nil t)))
    `(debug-print (quote ,read-data) ,read-data)))

(defsyntax debug-print-syntax
  (:merge :standard)
  (:dispatch-macro-char #\# #\> #'debug-print-reader))
