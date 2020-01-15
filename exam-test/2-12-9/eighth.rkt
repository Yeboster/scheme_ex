;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname first) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define legal?
    (lambda (str parity)
        (if (= (string-length str) 1) 
            (= (string->number str) parity) 
            (if (char=? (string-ref str 0) #\1) 
                (legal? (substring str 1) (if (= parity 1) 0 1)) 
                (legal? (substring str 1) parity)))))

(define parity-check-failures-rec
    (lambda (lst pos)
        (cond ((= (length lst) 0) null)
              ((not (legal? (car lst) 0)) (cons pos (parity-check-failures-rec (cdr lst) (+ pos 1))))
              (else (parity-check-failures-rec (cdr lst) (+ pos 1))))))

(define parity-check-failures
    (lambda (lst)
        (parity-check-failures-rec lst 0)))

(parity-check-failures '("0111" "1001" "0000" "1010")) ; -> (list 0)
(parity-check-failures '("0110" "1101" "0000" "1011")) ; -> (list 0 1)
(parity-check-failures '("0111" "1011" "0100" "1110")) ; -> (list 0 1 2 3)
(parity-check-failures '("0110" "1001" "0000" "1010")) ; -> '()