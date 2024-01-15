#lang racket
; Observe that our model of evaluation allows for combinations whose operators are compound expressions.
; Use this observation to describe the behavior of the following procedure:
; (define (a-plus-abs-b a b)
;  ((if (> b 0) + -) a b))

; if b is greater than 0, then evaluate the next expression using the + operator as a + b.
; if b is NOT greater than 0 (less than 0), then evaluate the next expression using the - operator as a - b.
; in other words, this function evaluates the expression a + |b| where b is the absolute value of b.