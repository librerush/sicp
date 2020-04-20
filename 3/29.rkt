#lang sicp

;; ex 3.29

;; (define (logical-nand a1 a2)
;;   (logical-not (logical-and a1 a2)))

;; (define (logical-or a1 a2)
;;   (logical-nand (logical-nand a1 a1)
;; 		(logical-nand a2 a2)))

(define (or-gate a b output)
  (let ((c (make-wire))
        (d (make-wire))
        (e (make-wire))
        (f (make-wire))
        (g (make-wire)))
    (and-gate a a c)
    (and-gate b b d)
    (inverter c e)
    (inverter d f)
    (and-gate e f g)
    (inverter g output)))
