#lang sicp

; ex 2.63

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))


(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
                     (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))


(define first-tree (make-tree 7
                         (make-tree 3
                               (make-tree 1 '() '())
                               (make-tree 5 '() '()))
                         (make-tree 9
                               '()
                               (make-tree 11 '() '()))))

(define second-tree
  (make-tree 3
             (make-tree 1 '() '())
             (make-tree 7
                        (make-tree 5
                                   '()
                                   '())
                        (make-tree 9
                                   '()
                                   (make-tree 11 '() '())))))

(define third-tree
  (make-tree 5
             (make-tree 3
                        (make-tree 1 '() '())
                        '())
             (make-tree 9
                        (make-tree 7 '() '())
                        (make-tree 11 '() '()))))
;; (tree->list-1 first-tree)
;; (tree->list-2 second-tree)

;; a. they produce the same results

;; b. first procedure has O(n*logn) order of growth
;;    second procedure has O(n) order of growth

