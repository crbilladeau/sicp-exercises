#lang racket
; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers.
; Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for
; very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers.
; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and
; to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end
; test. Does this work better for small and large numbers?

(define (square x) (* x x))

(define (average x y) 
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

;; OLD procedures
;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))

;(define (sqrt-iter guess x)
; (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;(sqrt 1234567890123) ; 1111111.1061109055

; (sqrt 12345678901234) ; does not finish

;(sqrt 12345678901230) ; 3513641.828819494

;(sqrt 0.00000000123) ; 0.031250013107186406

;(square (sqrt 0.00000000123)) ; 0.000976563319199322 does not equal 0.031250013107186406, which is what sqrt calculated for this number

; for big numbers, most of the time the computation does not finish due to the increasing complexity on each iteration.
; for small numbers, the result can be innaccurate by a couple orders of magnitude

(define (good-enough? previous-guess guess)
  (< (abs(/ (- guess previous-guess) guess)) 0.00000000001))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(sqrt 123456789012345)
(sqrt 0.00000000123456)

