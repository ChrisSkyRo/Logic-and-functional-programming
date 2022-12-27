; Counts the appearance of a number el in a list l
; (countAppearances 1 (list 1 2 3 1 2 1 1 4)) --> 4
( defun countAppearances(el l)
    ( cond
        ( (null l) 0 )
        ( (equal el (car l) ) (+ 1 (countAppearances el (cdr l) ) ) )
        ( t ( countAppearances el (cdr l) ) )
    )
)

; Returns the diference between two sets l1 and l2
; (setDifference (list 1 2 3 4 5) (list 1 4 5 6 7)) --> (2 3)
( defun setDifference(l1 l2)
    ( cond
        ( (null l1) (list) )
        ( (equal (countAppearances (car l1) l2) 0) (append (list (car l1)) (setDifference (cdr l1) l2)) )
        ( t (setDifference (cdr l1) l2) )
    )
)

; Reverses a list on all levels
; (reverseList (list 1 2 (list 3 4) 5 (list 6 (list 7 8)) 9)) --> (9 ((8 7) 6) 5 (4 3) 2 1)
( defun reverseList(l)
    ( cond
        ( (null l) (list) )
        ( (listp (car l)) (append (reverseList (cdr l)) (list(reverseList (car l)))) )
        ( t ( append (reverseList (cdr l)) (list (car l)) ) )
    )
)

; Builds a list with the first element of every list with an odd number of elements on a superficial level
; 

; Gets the first element if the list's length is an odd number
( defun getFirstElemIfOddLength(l)
    ( cond
        ( (oddp (length l)) (list(car l)) )
        ( t (list) )
    )
)

; Builds a list with the first element of every list elements
( defun buildFirstElemList(l)
    ( cond
        ( (null l) (list) )
        ( (listp (car l)) ( append (append (getFirstElemIfOddLength (car l)) (buildFirstElemList (car l)) ) (buildFirstElemList (cdr l)) )  )
        ( t (buildFirstElemList (cdr l)) )
    )
)

; Builds a list with the first element of every sublist
; (startBuildFirstElemList (list 1 2 (list 3 (list 4 5) (list 6 7)) 8 (list 9 10 11))) --> (1 3 9)
( defun startBuildFirstElemList(l)
    ( cond
        ( (null l) (list) )
        ( t (append (getFirstElemIfOddLength l) (buildFirstElemList l)) )
    )
)

; Returns the sum of the numerical atoms on a superficial level
; (numericSum (list 1 (list 2) 3 4 (list 5 6))) --> 8
( defun numericSum(l)
    ( cond
        ( (null l) 0 )
        ( (and (atom (car l)) (numberp (car l))) (+ (car l) (numericSum(cdr l))) )
        ( t (numericSum(cdr l)) )
    )
)
