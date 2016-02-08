;; this is how to load external modules in scheme
(load-from-path "/afs/nd.edu/user37/cmc/Public/cse332_sp16/scheme_dailies/d1/paradigms_d1.scm")
(use-modules (ice-9 paradigms_d1))

;; PATRICK DRUMM

;; the list q
;; notice it has a ' in front of the list; that tells the interpreter to read
;; the list literally (e.g., as atoms, instead of functions)
(define q '(turkey (gravy) (stuffing potatoes ham) peas))

;; question 1
(display "question 1: ")
(display (atom? (car (cdr (cdr q)))))
(display "\n")
;; output:
;;   #f
;;
;; explanation:
;;   q is defined as a list of 4 elements
;;   	= (turkey (gravy) (stuffing potatoes ham) peas)
;;   The inner 'cdr' returns a list of the last 3 elements of the list 
;;   	= ((gravy) (stuffing potatoes ham) peas)
;;   The next 'cdr' returns a list of the last 2 elements of that list
;;   	= ((stuffing potatoes ham) peas)
;;   Then 'car' returns the first element of that list
;;   	= (stuffing potatoes ham)
;;   'atom?' returns #f(false) because the element returned is a list and not an atom
;;   	= #f


;; question 2
(display "question 2: ")
(display (lat? (car (cdr (cdr q)))))
(display "\n")
;; output:
;;   #t
;;
;; explanation:
;;   q is defined as a list of 4 elements
;;   	= (turkey (gravy) (stuffing potatoes ham) peas)
;;   The inner three functions (car (cdr (cdr q))) are the same as in question 1, and thus they also return the third element of q
;;   	= (stuffing potatoes ham)
;;   'lat?' returns #t(true) because the element returned is a list of atoms
;;   	= #t


;; question 3
(display "question 3: ")
(display (cond ((atom? (car q)) (car q)) (else '())))
(display "\n")
;; output:
;;   turkey
;;
;; explanation:
;;   This question uses a conditional. It checks the first statement following 'cond' to see if it's true or false.
;;   Since the first element of q [ie. (car q)] is turkey, atom? returns a true value.
;;   Thus the next value following the atom? command [which also happens to be (car q)] is returned.
;;   Since (car q) is "turkey", this is why "turkey" is the output to question 3.

