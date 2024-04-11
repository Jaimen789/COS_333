#lang sicp

(define (pyramidVolume l h)
  (let ((one_third (/ 1 3)))
    (if (or (negative? l) (negative? h))
        0
        (* one_third (* l l) h))))

(pyramidVolume 3.2 4.8)


(define (getPositiveOddNumbers lst)
  (cond
    ((null? lst) '())
    ((and (odd? (car lst)) (> (car lst) 0))
     (cons (car lst) (getPositiveOddNumbers (cdr lst))))
    (else
     (getPositiveOddNumbers (cdr lst))))) ;skip number and continue with the list

(getPositiveOddNumbers '(-3 4 0 5 8 3)) ; Should display (5 3)




(define (doubleEveryOddElement lst)
  (cond
    ((null? lst) '())                                 ; If the list is empty, return an empty list.
    ((null? (cdr lst)) (list (* 2 (car lst))))        ; If there's only one element left, double it and return as list.
    (else (cons (* 2 (car lst))                       ; Otherwise, double the current element
                (cons (cadr lst)                      ; And keep the next element as it is
                      (doubleEveryOddElement (cddr lst)))))))  ; Recur with the rest of the list excluding the next element.


(display (doubleEveryOddElement '()))             ; Should display '()
(newline)
(display (doubleEveryOddElement '(4)))            ; Should display '(8)
(newline)
(display (doubleEveryOddElement '(4 3 5 2 44)))     ; Should display '(8 3 10 2)


(define (doubleEveryOddElement2 lst)
  (define (helper lst pos)
    (cond
      ((null? lst) '())
      ((eq? pos 'odd) (cons (* 2 (car lst)) (helper (cdr lst) 'even)))
      (else (cons (car lst) (helper (cdr lst) 'odd)))))
  
  (helper lst 'odd))

; Testing the function
(newline)
(display (doubleEveryOddElement2 '()))             ; Should display '()
(newline)
(display (doubleEveryOddElement2 '(4)))            ; Should display '(8)
(newline)
(display (doubleEveryOddElement2 '(4 3 5 2)))     ; Should display '(8 3 10 2)

