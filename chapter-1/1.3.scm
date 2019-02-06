(define (sumnsquare a b)
  (+ (* a a) (* b b)))

(define (sumOfSquareLarge x y z)
  (cond  ((>= x y z) (sumnsquare x y))
         ((>= y z x) (sumnsquare y z))
         ((>= z x y) (sumnsquare z x))
         ((>= x z y) (sumnsquare x z))
         ((>= z y x) (sumnsquare z y))
         ((>= y x z) (sumnsquare y x))
         ))

