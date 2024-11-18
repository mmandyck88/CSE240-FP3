;;;
; CSE240 Functional Programming 3 Homework
; Logic Gates
;
; Completion time: 18 hours
;
; @author Melissa Mandyck, Acuna code used
; @version February 18 2024
;;;


(display "Q1");Q1
(newline)
; AND gate enter your code here:
(define AND-Gate(
lambda (a b)
(if (= a 1)
b
0)))


; Test cases
(display "AND-Gate Output\n")
(display" Input\t\tOuput\n")
(display "a\tb\tc")(newline)
(newline)
;display input combinations
(AND-gate 0 0)
(AND-gate 0 1)
(AND-gate 1 0)
(AND-gate 1 1)
; Expected outputs
;0
;0
;0
;1
(newline)
; OR Test cases
; OR gate procedure
(define OR-Gate(
lambda (a b)
(if (= a 1)
1
b)))

;OR Heading Display
(display "OR-Gate Output\n")
(display "a\tb\tc")(newline)
(newline)
;Display Input Combinations
(OR-gate 0 0)
(OR-gate 0 1)
(OR-gate 1 0)
(OR-gate 1 1)
; Expected outputs
;0
;1
;1
;1
; Test cases
(define NOT-Gate(
lambda (a)
(if (= a 1)
0
1)))
(display "NOT-Gate Output\n")
(display" Input\t\tOuput\n")
(display "a\tb\tc")(newline)
(newline)
;NOT-Gate Input Combinations

(NOT-gate 0)
(NOT-gate 1)
; Expected outputs
;1
;0

(display "Q2")
;Q2
(newline)
; enter your code here:
(define (XOR-Gate input1 input2)
  (if (not (eq? input1 input2))
      1
      0))

; Test cases
(display "XOR-Gate Output\n")
(display" Input\t\tOuput\n")
(display "a\tb\tc")(newline)
(newline)
;Display XOR Input Combinations
(XOR-gate 0 0)
(XOR-gate 0 1)
(XOR-gate 1 0)
(XOR-gate 1 1)
; Expected outputs
;0
;1
;1
;0

;Q3.1
; define halfAdder enter your code here:
(define (half-adder x a b) (XOR-gate x (XOR-gate a b)))

;Q3.2
; define carry-out enter your code here:
(define (carry-out x a b) (OR-gate (AND-gate x (XOR-gate a b)) (AND-gate a b)))

;Q3.3
;define fullAddar enter your code here:
(define (full-adder x a b) (cons (half-adder x a b) (carry-out x a b)))

; Test cases
(Display "half-adder Output\n")
(half-adder 0 0 0) 	
(half-adder 0 0 1) 	
(half-adder 0 1 0) 	
(half-adder 0 1 1)	
(half-adder 1 0 0) 	
(half-adder 1 0 1)	
(half-adder 1 1 0) 	
(half-adder 1 1 1)

; Expected outputs
;0
;1
;1
;0
;1
;0
;0
;1


; Test cases
(Display "Full-adder Output\n")
(full-adder 0 0 0) 	
(full-adder 0 0 1) 	
(full-adder 0 1 0) 	
(full-adder 0 1 1)	
(full-adder 1 0 0) 	
(full-adder 1 0 1)	
(full-adder 1 1 0) 	
(full-adder 1 1 1)

; Expected outputs
;(0 . 0)
;(0 . 1)
;(0 . 1)
;(1 . 0)
;(0 . 1)
;(1 . 0)
;(1 . 0)
;(1 . 1)


(Display "Q4.1 define tail:\n");Q4.1
; define tail enter your code here:
(define (tail lst) (if (null? (cdr lst)) (car lst) (tail (cdr lst))))
(display(tail '(1 3 5 6 8)))
(newline)
(Display "Q4.2  Define rmtail:\n");Q4.2 Define rmtail
(define (rmtaillst lst)
  (reverse (cdr (reverse lst)))) ; reverse the list, remove the first element, and reverse it again
(display (rmtaillst '(1 3 5 6 8))) ; Prints (1 3 5 6)
(newline)


(Display "Q4.3 Fantastic Four:\n");Q4.3
; Step 1 size-n problem: Lines of code
; ---->
(define (formatResult lst) (if (= (length lst) 1) (list lst) (append (formatResult (rmtail lst)) (list (tail lst)) )))
(define (n-bit-adder A B n) (if (= (length A) (length B)) (recursiveAdd A B 0)) )
(define (recursiveAdd A B c) ; size n problem

; Step 2 Stopping condition: Lines of code
; ---->
(if (null? A) ; stopping condition
(list c) ; return value when stopping condition

; Step 3 size-m problem: Lines of code
; ---->
(append (recursiveAdd (rmtaillst A) (rmtaillst B) (cdr (full-adder (tail A) (tail B) c))) ; solution for size n-problem using size n-1 problem
; Step 4: Lines of code
; ---->
(list (car (full-adder (tail A) (tail B) c))) ; append sum bit to recursive result
           )                                        
)
)                           


;Q4.4
;Test procedures enter your code here:
(define X1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0) )
(define X2 '(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1) )
(display (n-bit-adder X1 X2 32))
(newline)
(newline)

;Test cases
(define x1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0) )	
(define x2 '(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1) )	
(define x3 '(0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1) )	
(define x4 '(1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0) )
(define x5 '(1 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1) )	
(define x6 '(1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0) )


(display "n-bit-adder Output\n")
(n-bit-adder  x1 x2 32)
(n-bit-adder  x3 x4 32)
(n-bit-adder  x5 x6 32)
(n-bit-adder  x2 x3 32)
(n-bit-adder  x4 x5 32)
(n-bit-adder  x1 x6 32)
; Expected outputs
;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(1 (1 0 1 1 1 0 0 0 1 1 1 0 0 1 0 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 1))
;(1 (0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 0))
;(1 (1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
;(0 (1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0))


;Q5 boilerplate (implementations for reduce and filter)
(define reduce
	  (lambda (op base x) ;passing by name
		(if (null? x)
			base
			(op (car x) (reduce op base (cdr x))))))

(define filter (lambda (pred a-list)
	(if (null? a-list)
	    '()
	    (if	(pred (car a-list))
			(cons (car a-list) (filter pred (cdr a-list)))
			(filter pred (cdr a-list)))))) 


(Display "Q5.1:\n");;Q5.1
; enter your code here:
(define (number-length lst)
    (reduce (lambda (x y) (+ 1 y)) 0 lst))
; test
(display (number-length '(1 1 0 1 0 0)))
(newline)
(Display "Q5.2:\n");Q5.2
; enter your code here:
(define (count-zeros lst)
    (reduce (lambda (x y) (+ (- 1 x) y)) 0 lst))
; test
(display (count-zeros '(1 1 0 1 0 0)))
(newline)
(Display "Q5.3:\n");Q5.3
; enter your code here:
(define (binary->string lst)
    (reduce (lambda (x y) (string-append (number->string x) y)) "" lst))
(display (binary->string '(1 1 0 1 0 0)))
