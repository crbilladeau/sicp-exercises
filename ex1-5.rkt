#lang racket
; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using
; applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
; (define (p) (p))

; (define (test x y) 
;   (if (= x 0) 
;       0 
;       y))
; Then he evaluates the expression
; (test 0 (p))
; What behavior will Ben observe with an interpreter that uses applicative-order evaluation?
; What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer.
; (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or
; applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate
; the consequent or the alternative expression.)

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0 
      y))

(test 0 (p))

; For applicative order, he will observe the following behavior:
; it will evaluate the arguements and then apply.
; (test 0 (p))
; 0 gets evaluated and then it will try to evaluate p
; (test 0 (p))
;      (if (= 0 0)
;     0
;     p))

; (test 0 (p))
;      (if (0))
;     0
;     p))
; p evaluates to p, so the function just keeps running in a loop, and tries to evaluate p over and over.

; For normal order, he will observe the following behavior:
; (test 0 (p)
;      (if (= 0 0)
;    0
;    p))
; since (= 0 0) evalutes to #t in the if statement, (p) will not be evaluated and the procedure returns 0.


