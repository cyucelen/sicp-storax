#lang scheme

; exercise 1.9

(define (dec a) (- a 1))
(define (inc a) (+ a 1))

(define (plus a b)
  (if (= a 0)
     b
     (inc (plus (dec a) b))))

; substitution model of plus
;   (plus 4 5)
;   (inc (plus 3 5))
;   (inc (inc (plus 2 5)))
;   (inc (inc (inc (plus 1 5))))
;   (inc (inc (inc (inc (plus 0 5)))))
;   (inc (inc (inc (inc 5))))
;   (inc (inc (inc 6)))
;   (inc (inc 7))
;   (inc 8)
;   9

(define (plus_ a b)
  (if (= a 0)
      b
      (plus_ (dec a) (inc b))))

; substitution model of plus_
;   (plus_ 4 5)
;   (plus_ 3 6)
;   (plus_ 2 7)
;   (plus_ 1 8)
;   (plus_ 0 9)
;   9

; tests
(plus 4 5)
(plus_ 4 5)

; observations

; plus is a recursive process. Specifically, linear recursive process, 
; since amount of information needed to keep track of it grows linearly with input `a`. 
; In recursive processes, by definition, expansion occurs as the process builds up a chain of deferred operations.
; The contraction occurs as the operations are actually performed. 
;
; plus_ is an iterative process. Altough the syntactic fact that the plus_ procedure calls itself, process' itself does not
; grow or shrink. At each step, all we need to keep track of, for any `a` or `b`, are current values of `a` and `b`. So, plus_ is an
; iterative process described by a recursive procedure. 
;
; Difference between 'recursive procedure' and 'recursive process' as follows:
;
; Recursive procedure defines the syntactic fact that the procedure definition refers to itself. 
; Recursive process defines how the process evolves.