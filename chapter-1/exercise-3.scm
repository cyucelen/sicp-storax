#lang scheme

; exercise 1.3

(define (max x y)
  (if (> x y) x y))

(define (square x)
  (* x x))

(define (sum-square x y)
  (+ (square x) (square y)))

(define (find-largest x y z)
  (max (max x y) z))

(define (find-second-largest x y z)
  (cond ((and (> x y) (> x z)) (max y z))
        ((and (> y x) (> y z)) (max x z))
        ((and (> z x) (> z y)) (max x y))))

(define (sum-square-larger x y z)
  (sum-square (find-largest x y z) (find-second-largest x y z)))

; tests

(= (sum-square-larger 1 2 3) 13)
(= (sum-square-larger 7 3 5) 74)
(= (sum-square-larger 4 1 9) 97)