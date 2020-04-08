#lang sicp

;; ex 3.13

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

;; (last-pair z)
;; list with no end

;; :-------------------------.
;; v                         :
;; x ----> . --> . --> . --> /
;;         :     :     :
;;         a     b     c
