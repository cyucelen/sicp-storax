#lang scheme

; exercise 1.4

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

; tests

(= (a-plus-abs-b 3 -5) 8)
(= (a-plus-abs-b 3 5) 8)

; observations
;
; Since default evalution model is applicative-oreder, we can use compund expressions for operator.
; In above procedure, we make use of this behavior to determine the operator.