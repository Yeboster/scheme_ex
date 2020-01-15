;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname first) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define sorted-string-linear
    (lambda (c l)
        (cond ((= (length l) 0) (list c))
              ((char<? c (car l)) (cons c l))
              ((char=? c (car l)) l)
              (else (cons (car l) (sorted-string-linear c (cdr l)))))))

(define sorted-char-list-rec
    (lambda (l)
        (if (= (length l) 0)
            null
            (sorted-string-linear (car l) (sorted-char-list-rec (cdr l)))))) ; This is genius, using custom cons implementation

(define sorted-char-list
    (lambda (str)
        (sorted-char-list-rec (string->list str))))

(sorted-char-list "") ; -> '()
(sorted-char-list "abc") ; -> (list #\a #\b #\c)
(sorted-char-list "cba") ; -> (list #\a #\b #\c)
(sorted-char-list "list of chars that occur in this text") ; -> (list #\space #\a #\c #\e #\f #\h #\i #\l #\n #\o #\r #\s #\t #\u #\x)