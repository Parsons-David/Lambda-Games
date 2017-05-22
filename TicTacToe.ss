(define board '( (~ X ~) (O ~ ~) (~ ~ X) ) )


(display "Welcome to Tic Tac Toe!\n")

;;; __printRow__
;;;
;;; - Prints an individual row of a board
;;; - Each char, lines between them and a
;;;    newline char at the end
;;; - r ~ row | (list)
;;;
(define printRow
  (lambda (r)
    (cond
      ((null? (cdr r)) (display (car r)) (display "\n"))
      (else (display (car r)) (display " | ") (printRow (cdr r)))
    )
  )
)

;;; __displayBoard__
;;;
;;; - Prints the whole playing board
;;; - b ~ board | (list)
;;;
(define displayBoard
  (lambda (b)
    (cond
      ((null? (cdr b)) (printRow (car b)))
      (else (printRow (car b)) (displayBoard (cdr b)))
    )
  )
)

;;; __rowUseHelp__
;;;
;;; - Helps notInUse method by checking an individual row
;;; - r ~ row | (list)
;;; - c ~ column | (number)
;;;
(define rowUseHelp
  (lambda (r c)
    (cond
      ((null? r) #f)
      ((> c 1) (rowUseHelp (cdr r) (- c 1)))
      (else (eq? (car r) '~))
    )
  )
)

;;; __rowUseHelp__
;;;
;;; - Checks if position (r, c) is not in use
;;; - b ~ board | (list)
;;; - r ~ row | (number)
;;; - c ~ column | (number)
;;;
(define notInUse?
  (lambda (b r c)
    (cond
     ((null? b) #f)
     ((> r 1) (notInUse? (cdr b) (- r 1) c))
     (else (rowUseHelp (car b) c))
    )
  )
)


(displayBoard board)

(display "\nRow 1:\n")
(notInUse? board 1 1)
(notInUse? board 1 2)
(notInUse? board 1 3)

(display "\nRow 2:\n")
(notInUse? board 2 1)
(notInUse? board 2 2)
(notInUse? board 2 3)

(display "\nRow 3:\n")
(notInUse? board 3 1)
(notInUse? board 3 2)
(notInUse? board 3 3)
