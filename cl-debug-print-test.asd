#|
  This file is a part of cl-debug-print project.
|#

(defsystem "cl-debug-print-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("cl-debug-print"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "cl-debug-print"))))
  :description "Test system for cl-debug-print"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
