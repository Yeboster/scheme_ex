;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname first) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define offset (char->integer #\0))

(define last-digit
  (lambda (base) (integer->char (+ (- base 1) offset)) ))

(define next-digit
  (lambda (dgt) (string (integer->char (+ (char->integer dgt) 1))) ))

(define increment
  (lambda (num base) ; 2 <= base <= 10
    (let ((digits (string-length num)))
      (if (= digits 0)
        "1"
        (let ((dgt (string-ref num (- digits 1))))
          (if (char=? dgt (last-digit base))
            (string-append (increment (substring num 0 (- digits 1)) base)
            "0")
            (string-append (substring num 0 (- digits 1)) (next-digit dgt))
            ))
            ))))

(increment "1011" 2)
