#! /usr/bin/env racket
#lang racket

;; count a number of SICP exercises

;; (define pattern #rx"^/[1-5]/([1-9]|[1-9][0-9]).(rkt|scm)$")
(define pattern #rx"^([1-9]|[1-9][0-9]).(rkt|scm)$")

;; chapters
(define dirs
  '("1" "2" "3" "4" "5"))

(define max-number-exercises
  (+ 46 97 82 79 52))

(define (in-dirs? p)
  (match (member p (map string->path dirs))
    [#f #f]
    [_  #t]))

(define (exercise? file)
  (regexp-match? pattern (path->string file)))

(define (count dir)
  (define (sum lst)
    (foldr + 0 lst))
  (define (filter-dir dir1)
    (filter (lambda (path1) (and (directory-exists? path1)
                                 (in-dirs? path1)))
            (directory-list dir1)))
  (define (traverse-dirs dirs)
    (map (lambda (dir1) (directory-list dir1)) dirs))
  ;; FIXME: rewrite in more efficient way
  (sum (flatten
        (map (lambda (dir1)
               (map (lambda (dir2)
                      (cond ((exercise? dir2) 1)
                            (else 0)))
                    dir1))
             (traverse-dirs (filter-dir dir))))))

(define (main)
  (let* ((dir ".")
         (num-exer (count dir)))
    (display "Done: ")
    (displayln num-exer)
    (display (* 100.0
                (/ (* 1.0 num-exer)
                   max-number-exercises)))
    (displayln "%.")))

(main)
