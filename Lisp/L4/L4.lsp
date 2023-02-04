(defun existsNode(L n)
    (cond 
        ( (null L) 0 )
        ( (equal (car L) n) 1 )
        ( t (+ (existsNode (cadr L) n) (existsNode (caddr L) n)) )
    )
)

(defun pathToNode(L n)
    (cond
        ((null L) nil)
        ( (equal (car L) n) (list n))
        ( (equal (existsNode (cadr L) n) 1) (append (list (car L)) (pathToNode (cadr L) n)) )
        ( (equal (existsNode (caddr L) n) 1) (append (list (car L)) (pathToNode (caddr L) n)) )
        ( t "Node doesn't exist" )
    )
)
