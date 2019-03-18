; calculate how many hours it is from the hours specified as the command line argument

; {{{ quicklisp initial set up
; load libraries
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
      (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))
; }}} quicklisp initial set up

(require :unix-opts)

(opts:define-opts
  (:name :help
   :description "print this help text"
   :short #\h
   :long "help"))

(multiple-value-bind (options free-args) (opts:get-opts)
  (if (getf options :help)
    (progn
      (opts:describe
        :prefix "You're in min2hour script. Usage: min2hour.lisp [minutes]")
      (opts:exit))) ;; <= optional return status.
  (when (= (list-length free-args) 0)
    (format t "Please specify one argument.~%")
    (opts:exit))
  (when (> (list-length free-args) 1)
    (format t "Please specify only one argument.~%")
    (opts:exit))

  (let ((minutes (parse-integer (car free-args))))
    (format t "~A minutes is ~2$ hours.~%" minutes (float (/ minutes 60)))))
