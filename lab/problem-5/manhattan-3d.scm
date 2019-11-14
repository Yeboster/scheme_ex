;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname manhattan) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define manhattan
  (lambda (i j)
    (if (or (= i 0) (= j 0))
        1
        (+ (manhattan (- i 1) j) (manhattan i (- j 1)))
    )))

(define manhattan-3d
  (lambda (x y z)
    (cond ((and (= x 0) (= y 0) (= z 0)) 0)
          ((= x 0) (manhattan y z))
          ((= y 0) (manhattan x z))
          ((= z 0) (manhattan x y))
          (else (+ (manhattan-3d (- x 1) y z) (manhattan-3d x (- y 1) z) (manhattan-3d x y (- z 1))))
    )))

(manhattan-3d 0 0 6)
(manhattan-3d 2 0 2)
(manhattan-3d 3 2 1)
(manhattan-3d 3 2 1)
(manhattan-3d 2 3 3)
