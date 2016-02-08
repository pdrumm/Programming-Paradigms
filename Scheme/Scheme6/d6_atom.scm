;; scheme daily homework 6
;; name: PATRICK DRUMM
;; date: 2/3/2016

;(use-modules (ice-9 debugging traps) (ice-9 debugging trace))

(load-from-path "/afs/nd.edu/user37/cmc/Public/cse332_sp16/scheme_dailies/d1/paradigms_d1.scm")
(use-modules (ice-9 debugging traps) (ice-9 debugging trace) (ice-9 paradigms_d1))

(define sum*
  (lambda (ttup)
    (cond
      ((null? ttup) 0)
      ((atom? (caar ttup)) (+ (caar ttup) (sum* (cdr ttup))))
      (else (+ (sum* (car ttup)) (sum* (cdr ttup))))
    )
  )
)
	; YOUR CODE HERE :-)


;(install-trap (make <procedure-trap>
;                            #:procedure sum*
;                            #:behaviour (list trace-trap trace-until-exit)))

;; tests!
(display (sum* '((5)) ))
(display "\n")

(display (sum* '((0) ((0) ((5))) ((0) ((10)))) ))
(display "\n")

(display (sum* '((0) ((0) ((5) ((7)))) ((0) ((10) ))) ))
(display "\n")

(display (sum* '((0) ((0) ((5) ((7) ) ((8) ))) ((0) ((10) ))) ))
(display "\n")

;; correct output:
;;   $ guile d6.scm
;;   5
;;   15
;;   22
;;   30

