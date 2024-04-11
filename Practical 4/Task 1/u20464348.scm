#lang racket

(define(getDivisors n lst)
  (define(divisor? a b)
    (=(remainder a b) 0))

  (cond
    ((null? lst) '())
    ((divisor? n (car lst))(cons (car lst) (getDivisors n (cdr lst))))
    (else (getDivisors n (cdr lst)))))

(display (getDivisors 10 '()))               
(display (getDivisors 10 '(20 50 60)))       
(display (getDivisors 10 '(1 20 30 2 5 40 10 60))) 