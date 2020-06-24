#lang sicp

;; ex 4.49

(define (parse-word word-list)
  (list (car word-list) (cadr word-list)))

;; '(sentence
;;   (simple-noun-phrase (article the) (noun student))
;;   (verb studies))

;; '(sentence
;;   (simple-noun-phrase (article the) (noun student))
;;   (verb-phrase
;;    (verb studies)
;;    (prep-phrase (prep for)
;;                 (simple-noun-phrase (article the) (noun student)))))
;; ...
