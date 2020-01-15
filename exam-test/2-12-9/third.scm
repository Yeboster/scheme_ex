;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname first) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define lcs ; valore: lista di terne
  (lambda (u v) ; u, v: stringhe
    (lcs-rec 1 u 1 v)
  ))

(define lcs-rec
  (lambda (i u j v)
    (cond ((or (string=? u "") (string=? v ""))
            null)
          ((char=? (string-ref u 0) (string-ref v 0))
            (cons (list i j (substring u 0 1))
              (lcs-rec (+ i 1) (substring u 1) (+ j 1) (substring v 1)) ))
          (else
            (better (lcs-rec (+ i 1) (substring u 1) j v) 
                    (lcs-rec i u (+ j 1) (substring v 1))))
    )))

(define better
  (lambda (x y)
    (if (< (length x) (length y)) y x)
    ))

; Remember to watch exactly the output of the exercise and compare with what you're returning!
; Be aware for every part of the exercise! Small details (string or char, index value) are very important for a good exam result.

(lcs "pino" "pino")
(lcs "pelo" "peso")
(lcs "ala" "palato")
(lcs "arto" "atrio")
