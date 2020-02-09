#lang scheme

; exercise 1.6

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

; tests

(= (new-if (= 2 3) 0 5) 5)
(= (new-if (= 1 1) 2 4) 2)

; observations
;
; Above tests looks like our new-if procedure works as intended but what if we use it to rewrite square-root program.
;
; Original square root by newtons method program

(define (sqrt x)
    (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                    x)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 
        0.001))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (square x) (* x x))

(sqrt 4)

; new-if version of square root by newtons method program

(define (sqrt-new x)
    (sqrt-iter-new 1.0 x))

(define (sqrt-iter-new guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter-new (improve guess x)
                    x)))

; (sqrt-new 4) ; not terminates!
;
; Since arguments of new-if evaluated before apply, sqrt-iter-new never terminates.
; thats why we have 'if' special form in Scheme.