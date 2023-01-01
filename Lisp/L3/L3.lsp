; Removes all occurences of an atom on all levels
; (removeAtom (list 1 (list 2 1 2 3 1) 2 3 (list 1 2 (list 8 8 2 7) 3 2 2 4) 5) 2) --> (1 (1 3 1) 3 (1 (8 8 7) 3 4) 5)
( defun removeAtom (l at)
    ( cond
        ( (null l) NIL )
        ( (and (atom l) (equal at l)) NIL )
        ( (atom l) l )
        ( (listp l) (delete nil (mapcar #'(lambda (a) (EremoveAtom a at)) l) ) )
    )
)
