#lang sicp
(#%require sicp-pict)

; ex 2.51

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (below-a painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-top
            (transform-painter
              painter2
              split-point
              (make-vect 1.0 0.5)
              (make-vect 0.0 1.0)))
          (paint-bottom
            (transform-painter
              painter1
              (make-vect 0.0 0.0)
              (make-vect 1.0 0.0)
              split-point)))
      (lambda (frame)
        (paint-top frame)
        (paint-bottom frame)))))

(define (below-b painter1 painter2)
  (rotate90 (beside (rotate270 painter1)
                    (rotate270 painter2))))

(paint (below-a einstein einstein))


            
