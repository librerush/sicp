#lang sicp

; ex 2.66

(define (record tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree record left right)
  (list record left right))

(define (make-record key value)
  (cons key value))
(define (record-key record)
  (car record))
(define (record-val record)
  (cdr record))

(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      false
      (let ((rcd (record set-of-records)))
        (cond ((< (record-key rcd) given-key)
               (lookup given-key (right-branch set-of-records)))
              ((> (record-key rcd) given-key)
               (lookup given-key (left-branch set-of-records)))
              ((= (record-key rcd) given-key)
               (record-val rcd))))))

(define records
  (make-tree (make-record 5 'five)
             (make-tree (make-record 3 'three)
                        (make-tree
                         (make-record 1 'one) '() '())
                        '())
             (make-tree (make-record 9 'nine)
                        (make-tree
                         (make-record 7 'seven) '() '())
                        (make-tree
                         (make-record 11 'eleven) '() '()))))

;; (lookup 3 records)
;; (lookup 11 records)
;; (lookup 12 records)

