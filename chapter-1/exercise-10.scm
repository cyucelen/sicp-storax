#lang scheme

; exercise 1.10

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

; tests

(A 1 10)
(A 2 4)
(A 3 3)

; observations
; Mathematical definitions
;            _
;           |   0                  ; y = 0
; A(x, y) = |   2*y                ; x = 0
;           |   2                  ; y = 1
;           |   A(x-1, A(x, y-1))  ; else
;           |_
;
; f(n) = A(0, n) = 2 * n
; g(n) = A(1, n) = A(0, A(1, (n-1))) = 2 * A(1, (n-1)) = 2 * 2 * A(1, (n-2)) = 2 * 2 * 2 * A(1, (n-3)) = 2^n
; h(n) = A(2, n) = A(1, A(2, (n-1))) = 2^(A(2, (n-1))) = 2^(A(1, A(2, (n-2)))) = 2^(2^(A(2,(n-2)))) = 2↑↑n
;
; (2↑↑n) means 2^(2^(2^...)) 
;              ¯¯¯¯n pcs¯¯¯¯ 
;
; i.e (2↑↑3) = (2^(2^(2)))
;
; Further reading:
; https://en.wikipedia.org/wiki/Knuth%27s_up-arrow_notation
; https://en.wikipedia.org/wiki/Ackermann_function