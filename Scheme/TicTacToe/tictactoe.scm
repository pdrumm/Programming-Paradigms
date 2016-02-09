;; scheme tictactoe homework
;; name: PATRICK DRUMM
;; date: 2/9/2016

(load-from-path "/afs/nd.edu/user37/cmc/Public/cse332_sp16/scheme_tictactoe/paradigms_ttt.scm")
;(use-modules (ice-9 paradigms_ttt))

(use-modules (ice-9 paradigms_ttt) (ice-9 debugging traps) (ice-9 debugging trace))

;; greatest
;; return the greatest value in a tup, e.g., (1 3 2) -> 3
(define greatest
  (lambda (tup)
    (cond
      ((null? tup) 0)
      ((null? (cdr tup)) (car tup))
      ((> (car tup) (cadr tup)) (greatest (cons (car tup) (cddr tup))))
      (else (greatest (cons (cadr tup) (cddr tup))))
    )
  )
)

;; positionof
;; you may assume that the given tup actually contains n
;; e.g., (positionof 23 (1 52 23 9)) -> 3
(define positionof
  (lambda (n tup)
    (cond
      ((eq? n (car tup)) 0)
      (else (+ 1 (positionof n (cdr tup))))
    )
  )
)

;; value
;; given a game state, return the value of that state:
;; 10 if it's a win
;; -10 if it's a loss
;; 0 if it is either a draw or not an ending state
(define value
  (lambda (p)
    (lambda (gs)
      (cond
        ((win? p gs) 10)
        ((win? (other p) gs) -10)
        (else 0)
      )
    )
  )
)

;; sum*-g
;; returns the sum of the values of the game tree
;; use (value (car ttup)) instead of (car (car ttup))
(define sum*-g
  (lambda (ttup f) ;; remember, the parameter f should be a FUNCTION
    (cond
      ((null? ttup) 0)
      ((null? (cdr ttup)) (f (car ttup)))
      (else
        (+ 
          (sum*-g (cadr ttup) f)
          (sum*-g (cons (car ttup) (cddr ttup)) f)
        )
      )
    )
  )
)

;; child-value
;; input is the cdr of the game tree
;; This fxn will loop through each each child of the game tree and 
;; returns a list of the children's values
(define children-vals
  (lambda (p gt)
    (cond
      ((null? gt) '())
      (else
        (cons (sum*-g (car gt) (value p)) (children-vals p (cdr gt)))
      )
    )
  )
)

;; locate-child
;; given a list gt and a position n, returns gt[n]
(define locate-child
  (lambda (n gt)
    (cond
      ((zero? n) (caar gt))
      (else (locate-child (- n 1) (cdr gt)))
    )
  )
)

;; MODIFY this function so that given the game tree 
;; (where the current situation is at the root),
;; it returns the recommendation for the next move
(define nextmove
  (lambda (p gt)
    (locate-child
      (positionof
        (greatest (children-vals p (cdr gt)))
        (children-vals p (cdr gt))
      )
      (cdr gt)
    )
  )
)

;; what is the current game situation?
(display "Current State:     ")
(display (car (onegametree)))
(display "\n")

;; test of nextmove, where should we go next?
(display "Recommended Move:  ")
(display (nextmove 'x (onegametree)))
(display "\n")

;; correct output:
;;   $ guile tictactoe.scm
;;   Current State:     (x o x o o e e x e)
;;   Recommended Move:  (x o x o o x e x e)

