#lang sicp

;; ex 3.26

(define (foldr op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (foldr op initial (cdr sequence)))))

(define (make-tree entry left right)
  (list entry left right))
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (make-empty-tree)
  (make-tree '() '() '()))

(define (empty-tree? tree)
  (= 3 (foldr (lambda (x y)
		(+ (if (null? x) 1 0) y))
	      0
	      tree)))

(define (empty-left-branch? tree)
  (null? (left-branch tree)))

(define (empty-right-branch? tree)
  (null? (right-branch tree)))

(define (set-entry! tree x)
  (set-car! tree x))

(define (set-left-branch! tree x)
  (set-car! (cdr tree) x))

(define (set-right-branch! tree x)
  (set-car! (cddr tree) x))


(define (make-table)
  (let ((local-table (list '*table*
			   (make-empty-tree))))
    (define (insert! key value)
      (define (iter tree)
	(cond ((empty-tree? tree)
	       (set-entry! tree (cons key value)))
	      ((> key (car (entry tree)))
	       (if (empty-right-branch? tree)
		   (set-right-branch!
		    tree
		    (make-tree (cons key value)
			       '()
			       '()))
		   (iter (right-branch tree))))
	      ((< key (car (entry tree)))
	       (if (empty-left-branch? tree)
		   (set-left-branch!
		    tree
		    (make-tree (cons key value)
			       '()
			       '()))
		   (iter (left-branch tree))))
	      (else (set-entry! tree (cons key value)))))
      (iter (cadr local-table)))
    (define (lookup key)
      (define (iter tree)
	(cond ((empty-tree? tree) false)
	      ((> key (car (entry tree)))
	       (if (empty-right-branch? tree)
		   false
		   (iter (right-branch tree))))
	      ((< key (car (entry tree)))
	       (if (empty-left-branch? tree)
		   false
		   (iter (left-branch tree))))
	      (else (cdr (entry tree)))))
      (iter (cadr local-table)))
    (define (dispatch m)
      (cond ((eq? m 'insert-proc!) insert!)
	    ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'display-proc)
	     (display local-table)
	     (display "\n"))
	    (else (error "Unknown operation: TABLE" m))))
    dispatch))

;; (define z (make-table))
;; ((z 'insert-proc!) 12 'a)
;; ((z 'insert-proc!) 15 'b)
;; ((z 'insert-proc!) 0 'z)
;; ((z 'insert-proc!) 42 'c)
;; ((z 'insert-proc!) 21 'd)
;; ((z 'insert-proc!) 15 'e)
;; ((z 'lookup-proc) 15)
