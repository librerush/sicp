#lang sicp

;; ex 4.47

(define (parse-verb-phrase)
  (amb (parse-word verbs)
       (list 'verb-phrase
             (parse-verb-phrase)
             (parse-prepositional-phrase))))

;; a. No, it does not (goes to infinite loop)
;; b. It does not
