; ex 1.12
(define (pascal row col)
  (if (or (= col 1) (= col row))
      1
      (+ (pascal (- row 1) col)
	 (pascal (- row 1) (- col 1)))))

