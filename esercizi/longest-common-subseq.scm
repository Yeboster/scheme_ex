;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname long-len-common-subsequence) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; longest length common subsequence
(define longest
  (lambda (str str2)
    (if (< (string-length str) (string-length str2))
        str2
        str)))

(define lcs ; val: string
  (lambda (u v) ; val: string
    (cond ((or (string=? u "") (string=? "" v)) "")
          ((char=? (string-ref u 0) (string-ref v 0))
           (string-append (string (string-ref u 0)) (lcs (substring u 1) (substring v 1)))
          )
          (else (longest (lcs (substring u 1) v)
                     (lcs u (substring v 1))
                )
          ))))


(lcs "ACGT" "ACGT")
(lcs "GACGACGTTTACGACGACGTTTACGT" "ACGACGACGTTTACGTACGACGACGTTTACGT")
