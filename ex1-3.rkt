#lang racket
;; Define a procedure that takes three numbers
;; as arguments and returns the sum of the squares
;; of the two larger numbers.

(define (square x) (* x x))

(define (sum-square x y) (+ (square x) (square y)))

(define (sum-of-squares x y z)
  (cond ((and (<= x y) (<= x z)) (sum-square y z))
        ((and (<= y x) (<= y z)) (sum-square x z))
        (else (sum-square x y))))

(= (sum-of-squares 10 10 10) (sum-square 10 10)) ;; #t true
(= (sum-of-squares 1 10 10) (sum-square 10 10))
(= (sum-of-squares 10 1 10) (sum-square 10 10))
(= (sum-of-squares 10 10 1) (sum-square 10 10))

(= (sum-of-squares 1 10 100) (sum-square 10 100))
(= (sum-of-squares 1 100 10) (sum-square 10 100))
(= (sum-of-squares 10 1 100) (sum-square 10 100))
(= (sum-of-squares 10 100 1) (sum-square 10 100))
(= (sum-of-squares 100 10 1) (sum-square 10 100))
(= (sum-of-squares 100 1 10) (sum-square 10 100))
