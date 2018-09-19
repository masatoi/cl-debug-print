#|
  This file is a part of cl-debug-print project.
|#

(defsystem "cl-debug-print"
  :version "0.1.0"
  :author "Satoshi Imai"
  :license "MIT"
  :depends-on ("cl-syntax")
  :components ((:module "src"
                :components
                ((:file "cl-debug-print"))))
  :description "A reader-macro for debug print"
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.org"))
  :in-order-to ((test-op (test-op "cl-debug-print-test"))))
