; ex 1.8
(define (cubeRoot x)
  (cubeIter 1.0 x))

(define (cubeIter guess x)
  (if (goodEnough? guess (improveCube guess x))
      guess
      (cubeIter (improveCube guess x) x)))

(define (goodEnough? guess x)
  (> epsilon (abs (- guess x))))

(define (improveCube guess x)
  (cubeAvg (* 2 guess) (/ x (square guess))))

(define (cubeAvg x y)
  (/ (+ x y) 3))

