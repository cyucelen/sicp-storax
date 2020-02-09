#lang scheme

; exercise 1.7

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (better-good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (better-good-enough? guess x)
  (< 
    (/ 
      (abs (- (square guess) x)) 
      (abs x))
    0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

; tests

(string-append "approximation: " (number->string (sqrt 0.000123)))
(string-append "real value:    0.01109053651")

; observations
;
; Let x is the exact value and x' is the approximation. ||x - x'|| gives the error of approximation of x' to the x.
; This is called absolute error, it represents the size of error but it doesn't give any information about significance of the error.
; For example, lets say absolute error is 3.12, is this significant? If the exact value was 72382323.23, then it is not that significant.
; However if the correct value is 5.73, then absolute error of 3.12 is very significant.
; To solve the problem of significance, we may compare the absolute error relative to exact value. Thus, we define relative error to ratio
; between absolute error and exact value; which is (||x - x'||)/||x||.
; By using relative error, we are able to compute square roots of small number effectively in above example.