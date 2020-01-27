#lang sicp

; ex 2.70

(define lyrics-msg
  '(Get a job
        Sha na na na na na na na na
        Get a job
        Sha na na na na na na na na
        Wah yip yip yip yip yip yip yip yip yip
        Sha boom))

(define lyrics-tree
  (generate-huffman-tree '((a 2) (Get 2) (Sha 3) (Wah 1)
                                 (boom 1) (job 2) (na 16) (yip 9))))

;; a. (length (encode lyrics-msg lyrics-tree))
;;    87 bits are required

;; b. log2 8 = 3 bits
