#lang sicp

; ex 2.57

(define (compose f g)
  (lambda (x) (f (g x))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))


(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        ((and (number? a1) (pair? a2))
         (let ((num (+ a1 (fold-right + 0 (filter number? a2))))
               (term (filter (compose not number?) a2)))
           (cond ((null? term) num)
                 ((= num 0) term)
                 (else (list '+ num term)))))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2))
         (* m1 m2))
        ((and (number? m1) (pair? m2))
         (let ((num (+ m1 (fold-right * 1 (filter number? m2))))
               (term (filter (compose not number?) m2)))
           (cond ((null? term) num)
                 ((= num 1) term)
                 (else (list '* num term)))))
        (else (list '* m1 m2))))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (cond ((> (length s) 3) (cons '+ (cddr s)))
                         ((= (length s) 3) (caddr s))
                         (else (error "augend " s))))
                           

(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (cond ((> (length p) 3) (cons '* (cddr p)))
                               ((= (length p) 3) (caddr p))
                               (else (error "multiplicand " p))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x)
  (cadr x))

(define (exponent x)
  (caddr x))

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e)) (expt b e))
        (else (list '** b e))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (make-product (exponent exp)
                          (make-exponentiation (base exp)
                                               (make-sum (exponent exp) -1)))
                       (deriv (base exp) var)))
        (else
          (error "unknown expression type: DERIV" exp))))

; (deriv '(* x y (+ x 3)) 'x)
; (+ (* x y) (* y (+ x 3)))


