;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname fourth) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
#| Definisci formalmente una procedura cyclic-string in Scheme che, dati come argomenti una stringa pattern e un
numero naturale length, assuma come valore la stringa di lunghezza length risultante dalla ripetizione ciclica di pattern,
eventualmente troncata a destra. Per esempio, nel caso dell’espressione (cyclic-string "abcd" n) il risultato
della valutazione per n = 0, 1, 2, 4, 5, 11 deve essere, rispettivamente: "", "a", "ab", "abcd", "abcda",
"abcdabcdabc". 
|#

; (define modulo
;     (lambda (mod n)
;         ()))

; tree recursion
(define cyclic-string
    (lambda (pattern n)
        (cond ((= n 0) "")
            (else (string-append 
                (cyclic-string pattern (- n 1)) 
                (string (string-ref pattern 
                                    (modulo (- n 1) (string-length pattern)))))))))

; tail recursion
(define cyclic-string-tail-rec
    (lambda (pattern n c res)
        (cond ((= c n) res)
            (else
                (cyclic-string-tail-rec pattern n (+ c 1) 
                (string-append res (string (string-ref pattern (modulo c (string-length pattern))))))))))

(define cyclic-string-wrapped
    (lambda (p n)
        (cyclic-string-tail-rec p n 0 "")))

(cyclic-string-wrapped "abcd" 11) ; => "abcdabcdabc"
(cyclic-string-wrapped "abcd" 5) ; => "abcda"
