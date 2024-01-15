#lang racket
; Alyssa P. Hacker doesn’t see why if needs to be provided as a special form.
; “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks.
; Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

; (define (new-if predicate 
;                 then-clause 
;                 else-clause)
;   (cond (predicate then-clause)
;        (else else-clause)))
; Eva demonstrates the program for Alyssa:

; (new-if (= 2 3) 0 5)
; 5

; (new-if (= 1 1) 0 5)
; 0
; Delighted, Alyssa uses new-if to rewrite the square-root program:

; (define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x) x)))
; What happens when Alyssa attempts to use this to compute square roots? Explain.

; If she uses this to compute square roots, the program will create an infinite loop.
; This is because each subexpression is evaluated before the procedure is applied. So no matter what the result of the first predicate,
; the program will always run both the alteratives in addition. Since the last alternative calls the function recursively,
; it will run the function in an infinite loop by calling itself again.