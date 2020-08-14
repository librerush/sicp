#lang sicp

;; ex 5.39

(define (make-lex-address frame displacement)
  (cons frame displacement))

(define (frame-number lex-address)
  (car lex-address))

(define (displacement-number lex-address)
  (cdr lex-address))

(define (lexical-address-lookup lex-address env)
  (let ((val
         (list-ref (list-ref env (frame-number lex-address))
                   (displacement-number lex-address))))
    (if (eq? val '*unassigned*)
        (error "Unassigned variable -- lookup" lex-address)
        val)))

(define (lexical-address-set! lex-address val env)
  (let ((frame (list-ref env (frame-number lex-address))))
    (list-set! frame (displacement-number lex-address) val)))
