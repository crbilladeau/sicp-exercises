#lang racket
;A function f is defined by the rule that f(n)= n if n<3 and f(n) = f(n−1)+2f(n−2)+3f(n−3) if n≥3. Write a procedure that computes f
; by means of a recursive process. Write a procedure that computes f by means of an iterative process.

; things to remember. for recursive processes, the calculation get called within the recursive call, whereas with iterative processes
; the calculations get called OUTSIDE of the recursive call.

(define (f-recursive n)
  (if (< n 3)
      n
    (+ (f-recursive (- n 1))
       (* 2 (f-recursive(- n 2)))
       (* 3 (f-recursive (- n 3))))))

(define (f-iterative n)
  (define (f-iter a b c counter)
    (if (= counter 0)
        a
        (f-iter b c (+ c (* 2 b) (* 3 a))
                (- counter 1))))
  (f-iter 0 1 2 n))

(f-recursive 5)
(f-iterative 5)

; alt

(define (f-iterator n)
  (define (f-iter a b c count)
    (cond ((= 0 count) a)
          (else (f-iter b
                        c
                        (+ c
                           (* 2 b)
                           (* 3 a))
                        (- count 1)))))
    (f-iter 0 1 2 n))

(f-iterator 5)

; another

(define (f n)
  (f-iter 0 1 2 n))

(define (f-iter a b c count)
  (if (= count 0) a
  (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))

(f 5)