#lang sicp

;; ex 5.18

(define (make-register name)
  (let ((contents '*unassigned*)
        (trace? #f))
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set)
             (lambda (value)
               (if trace?
                   (begin
                     (display "(reg ")
                     (display name)
                     (display " : ")
                     (display contents)
                     (display " -> ")
                     (display value)
                     (display ")")
                     (newline)))
               (set! contents value)))
            ((eq? message 'trace-on)
             (set! trace? #t))
            ((eq? message 'trace-off)
             (set! trace? #f))
            (else
             (error "Unknown request -- REGISTER" message))))
    dispatch))

;; In make-new-machine
;; ...
;; ((eq? message 'trace-reg-on)
;;  (lambda (name)
;;    (let ((r (assoc name register-table)))
;;      (if r
;;          ((cadr r) 'trace-on)))))
;; ((eq? message 'trace-reg-off)
;;  (lambda (name)
;;    (let ((r (assoc name register-table)))
;;      (if r
;;          ((cadr r) 'trace-off)))))
;; ...

(define (trace-register-on machine reg-name)
  ((machine 'trace-reg-on) reg-name))

(define (trace-register-off machine reg-name)
  ((machine 'trace-reg-off) reg-name))
