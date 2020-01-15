;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname first) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define r-val ; val: integer
    (lambda (str) ;str: string with .101010 format
        (r-val-rec (substring str 1) -1)) ; removing the point from the init string
    )

(define r-val-rec ; val: integer
    (lambda (str exponent) ; str: string with 101010 format ; exponent: signed integer
        (let ((val (* (expt 2 exponent) (string->number (string (string-ref str 0)))))) 
            (if (= (string-length str) 1) 
                val
                (+ val (r-val-rec (substring str 1) (- exponent 1)))))))

(r-val ".1") ; -> 0.5
(r-val ".011") ; -> 0.375