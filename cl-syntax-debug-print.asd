(in-package :cl-user)

(defpackage :cl-syntax-debug-print-asd
  (:use :cl :asdf))
(in-package :cl-syntax-debug-print-asd)

(defsystem "cl-syntax-debug-print"
  :version "0.1.0"
  :author "Satoshi Imai"
  :license "MIT"
  :description "CL-Synax reader system for cl-debug-print"
  :depends-on ("cl-syntax" "cl-debug-print")
  :components
  ((:file "syntax")))
