;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname manhattan) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define manhattan
  (lambda (i j)
    (if (and (= i 0) (= j 0))
        1
        (+ (manhattan (- i 1) j) (manhattan i (- j 1)))
    )))

(manhattan 3 3)
