;; scheme daily homework 2
;; name: PATRICK DRUMM
;; date: 1/25/16

;; the test lists
;; notice they have a ' in front of the lists; that tells the interpreter to read
;; the list literally (e.g., as atoms, instead of functions)
(define testlist1 '(turkey gravy stuffing potatoes ham peas))
(define testlist2 '(bacon turkey beef turkey))
(define testlist3 '(bacon turkey beef))

;; replacefirst

; Plan of action:
; see if car is the search word
; if it is, replace a with b and then return
; else, recurse on the cdr
(define replacefirst
  (lambda (a b lat)
    (cond
      ((null? lat) '())
      ((eq? a (car lat)) (cons b (cdr lat)))
      (else (cons (car lat) (replacefirst a b (cdr lat))))
    )
  )
)
    ;; right now replacefirst always returns an empty list
    ;; make it return a lat with the first instance of a replaced with b
    ;; see the tests and example output below...

;; tests!
(display (replacefirst 'turkey 'cheese testlist1))
(display "\n")

(display (replacefirst 'turkey 'bacon testlist2))
(display "\n")

(display (replacefirst 'sauce 'apple testlist3))
(display "\n")

;; notice that this is equivalent to using testlist3
(display (replacefirst 'beef 'carrots (list 'bacon 'turkey 'beef)))
(display "\n")

;; correct output:
;;   $ guile d2.scm
;;   (cheese gravy stuffing potatoes ham peas)
;;   (bacon bacon beef turkey)
;;   (bacon turkey beef)
;;   (bacon turkey carrots)

