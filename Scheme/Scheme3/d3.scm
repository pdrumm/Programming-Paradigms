;; scheme daily homework 3
;; name: PATRICK DRUMM
;; date: 1/27/2016

(load-from-path "/afs/nd.edu/user37/cmc/Public/cse332_sp16/scheme_dailies/d3/paradigms_d3.scm")
(use-modules (ice-9 paradigms_d3))

;; double
;;;;;;;;;
;; Plan of Action:
;; Recursively subtract 1 from n until n is equal to zero.
;; Then, add 2 to n for each time that 1 was subtracted from it.
;;
(define double 
  (lambda (n)
    (cond
      ((zero? n) 0) ;; base case
      (else (add1 (add1 (double (sub1 n))))) ;; recurse on n
    )
  )
)
    ;; right now double always returns the same number given to it
    ;; make it return *double* that number
    ;; remember that ``number'' means positive integer, for now
    ;; use *only* the functions add1, sub1, and zero?
    ;; do *not* use +, -, *, /, etc.

;; tests!
(display (double 9))
(display "\n")

(display (double 2))
(display "\n")

(display (double 45))
(display "\n")

;; correct output:
;;   $ guile d3.scm
;;   18
;;   4
;;   90

