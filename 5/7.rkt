#lang sicp

;; ex 5.7

(define expt-machine
  (make-machine
   '(n b val continue)
   (list (list '= =) (list '- -)
         (list '* *))
   ...))

(define expt-machine
  (make-machine
   '(n b counter product)
   (list (list '= =) (list '- -)
         (list '* *))
   ...))

(set-register-contents! expt-machine 'b 2)
(set-register-contents! expt-machine 'n 32)
(start expt-machine)
(get-register-contents expt-machine 'val)
