#lang racket
; Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x ,
;then a better approximation is given by the value
; x/y2+2y3

; Use this formula to implement a cube-root procedure analogous to the square-root procedure.
; (In 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root procedures.)

(define (cube x) (* x x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))
  
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-iter guess x)
  (if (good-enough? (improve guess x) guess)
  guess
  (cube-iter (improve guess x) x)))

(define (cube-root x)
  (cube-iter 1.0 x))

(cube-root 123456789012345)
(cube-root 0.00000000123456)
