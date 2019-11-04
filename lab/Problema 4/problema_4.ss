;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname problema_4) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
;data una rappresentazione BTR (stringa), restituisce la cifra meno significativa(carattere) 
;oppure zero (#\.) se l’argomento è la stringa vuota
(define lsd
  (lambda (btr-s) 
    (if (string=? btr-s "")
        #\.
        (string-ref btr-s (- (string-length btr-s) 1)))
    )
  )


;data una rappresentazione BTR (stringa), restituisce la parte che precede l’ultimacifra (stringa)
; oppure la stringa vuota ("") se l’argomento è la stringa vuota
(define head
  (lambda (btr-s)
    (if (string=? btr-s "")
        #\.
        (substring btr-s 0 (- (string-length btr-s) 1)))
    )
  )

;data una rappresentazione BTR (stringa), restituisce la rappresentazione non vuota
;equivalente in cui le eventuali cifre zero (#\.) in testa, ininfluenti, sono rimosse
(define normalized-btr
  (lambda (btr-s)
    (let ( (fb (substring btr-s 0 1)) )
      (if (string=? fb ".")
          (normalized-btr (substring btr-s 1))
          btr-s)
      )
    )
  )

;date due cifre BTR “incolonnate” e il relativo riporto BTR in entrata (caratteri),
;restituisce il riporto BTR in uscita (carattere) conseguente alla somma delle cifre
;MODELLO: btr-digit-sum
(define btr-carry 
  (lambda ()
    #f)
  )

;date le rappresentazioni BTR di due interi (stringhe) e il riporto in entrata (carattere),
;restituisce la rappresentazione BTR della somma inclusiva del riporto
(define btr-carry-sum
  (lambda ()
    #f)
  )

(define btr-digit-sum                    ; val:     carattere +/./-
  (lambda (u v c)                        ; u, v, c: caratteri +/./-
    (cond ((char=? u #\-)                ; u v c
           (cond ((char=? v #\-)
                  (cond ((char=? c #\-)  ; - - -
                         #\.)
                        ((char=? c #\.)  ; - - .
                         #\+)
                        ((char=? c #\+)  ; - - +
                         #\-)))
                 ((char=? v #\.)
                  (cond ((char=? c #\-)  ; - . -
                         #\+)
                        ((char=? c #\.)  ; - . .
                         #\-)
                        ((char=? c #\+)  ; - . +
                         #\.)))
                 ((char=? v #\+)         ; - + c
                  c)))
          ((char=? u #\.)
           (cond ((char=? v #\-)
                  (cond ((char=? c #\-)  ; . - -
                         #\+)
                        ((char=? c #\.)  ; . - .
                         #\-)
                        ((char=? c #\+)  ; . - +
                         #\.)))
                 ((char=? v #\.)         ; . . c
                  c)
                 ((char=? v #\+)
                  (cond ((char=? c #\-)  ; . + -
                         #\.)
                        ((char=? c #\.)  ; . + .
                         #\+)
                        ((char=? c #\+)  ; . + +
                         #\-)))))
          ((char=? u #\+)
           (cond ((char=? v #\-)         ; + - c
                  c)
                 ((char=? v #\.)
                  (cond ((char=? c #\-)  ; + . -
                         #\.)
                        ((char=? c #\.)  ; + . .
                         #\+)
                        ((char=? c #\+)  ; + . +
                         #\-)))
                 ((char=? v #\+)
                  (cond ((char=? c #\-)  ; + + -
                         #\+)
                        ((char=? c #\.)  ; + + .
                         #\-)
                        ((char=? c #\+)  ; + + +
                         #\.)))))
          )))