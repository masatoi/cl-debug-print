(defpackage cl-debug-print
  (:nicknames :debug-print)
  (:use #:cl
        #:cl-syntax
        #:named-readtables)
  (:export #:debug-print
           #:debug-print-reader
           #:debug-push
           #:debug-push-reader
           #:*use-describe*
           #:*destination*
           #:*dbg*
           #:clear-dbg
           #:debug-print-syntax))
(in-package :cl-debug-print)

(defvar *use-describe* nil
  "When *USE-DESCRIBE* is true, describe is used for debug prints.")

(defvar *destination* nil
  "*DESTINATION* allows to configure destination stream for debug prints.")

(defvar *dbg* nil
  "*DBG* is a list, and using DEBUG-PUSH(#!) will be pushed to this list.
To clear this variable, use the CLEAR-DBG function.")

(defun debug-print (pre-exp exp)
  (let ((*destination* (or *destination* *standard-output*)))
    (if *use-describe*
        (format *destination* "~S => ~A~%" pre-exp
                (with-output-to-string (s)
                  (describe exp s)))
        (format *destination* "~S => ~S~%" pre-exp exp)))
  exp)

(defun debug-print-reader (stream char1 char2)
  (declare (ignore char1 char2))
  (let ((read-data (read stream t nil t)))
    `(debug-print (quote ,read-data) ,read-data)))

(defun clear-dbg ()
  (setf *dbg* nil))

(defun debug-push (obj)
  (push obj cl-debug-print:*dbg*)
  obj)

(defun debug-push-reader (stream char1 char2)
  (declare (ignore char1 char2))
  (let ((read-data (read stream t nil t)))
    `(debug-push ,read-data)))

(defsyntax debug-print-syntax
  (:merge :standard)
  (:dispatch-macro-char #\# #\> #'debug-print-reader)
  (:dispatch-macro-char #\# #\! #'debug-push-reader))
