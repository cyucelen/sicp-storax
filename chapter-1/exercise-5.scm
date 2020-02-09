#lang scheme

; exercise 1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; tests

; (test 0 (p)) ; not terminates!

; observations
;
; Since default evalution model is applicative-order, the expression (test 0 (p)) evaluates its arguments first. 
; Because of (p) expands to itself, this program never terminates.
; If normal-order evaluation is applied, program successfuly terminates with 0 value, because in normal-order evaluation,
; evaluation model is 'fully expand then apply'.