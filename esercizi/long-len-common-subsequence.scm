;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname long-len-common-subsequence) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; longest length common subsequence
(define llcs
  (lambda (u v)
    (cond ((or (string=? u "") (string=? "" v)) 0)
          ((char=? (string-ref u 0) (string-ref v 0))
           (+ 1 (llcs (substring u 1) (substring v 1)))
          )
          (else (max (llcs (substring u 1) v)
                     (llcs u (substring v 1))
                )
          ))))

(llcs "ACGT" "ACGT")
