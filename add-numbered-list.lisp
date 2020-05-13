; {{{ boilerplate
; load tools that will help us code easier
(load "~/quicklisp/setup.lisp") ; tool to load external systems
(require "asdf") ; tool to load local systems

(asdf:load-system "un-utils")
(use-package :un-utils.simple-syntax) ; always use simple-syntax because we are newbies
; }}}

; If the input is
;
;   a
;   b
;   c
;
; , then the output is
;
;   1. a
;   2. b
;   3. c

(let ((counter 1))
  (for-each-$line-in *standard-input*
    (print-line "~A. ~A" counter $line)
    (incf counter)))
