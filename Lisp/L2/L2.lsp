; Returns the left subtree
; (getLTree '(b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) 0 0) --> (B 2 C 1 I 0 F 1 G 0)
( defun getLTree(l nodes edges)
    ( cond
        ( (null l) (list) )
        ( (= (+ edges 1) nodes) (list) )
        ( t (append (list (car l)) (list (cadr l)) (getLTree (cddr l) (+ nodes 1) (+ edges (cadr l)))) )
    )
)

; Returns the right subtree
; (getRTree '(b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) 0 0) --> (D 2 E 0 H 0)
( defun getRTree(l nodes edges)
    ( cond
        ( (null l) (list) )
        ( (= (+ edges 1) nodes) l )
        ( t (getRTree (cddr l) (+ nodes 1) (+ edges (cadr l))) )
    )
)

; Returns the left subtree
( defun leftTree(l)
    (getLTree (cddr l) 0 0)
)

; Returns the left subtree
( defun rightTree(l)
    (getRTree (cddr l) 0 0)
)

; Returns the depth of a node in a tree
; (getDepth '(a 2 b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) 'e) --> 2
( defun getDepth(l node)
    ( cond
        ( (null l) -100000 )
        ( (equal (car l) node) 0 )
        ( t (+ 1 (max (getDepth (leftTree l) node) (getDepth (rightTree l) node) ) ) )
    )
)

; Returns the depth of a node in a tree
; (depth '(a 2 b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) 'e) --> 2
( defun depth(l node)
    ( cond
        ( (< (getDepth l node) 0) nil )
        (t (getDepth l node) )
    )
)
