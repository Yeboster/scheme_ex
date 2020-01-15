;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname first) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define av
    (lambda (lst)
        (let ((fst (car lst))(snd (cadr lst))
                        (comparer (lambda (a b)
                            (cond ((< (+ a b) 0) -1)
                                  ((= (+ a b) 0)  0)
                                  (else 1)))))
            (cond ((= (length lst) 2) (list (comparer fst snd)))
                  (else (cons (comparer fst snd) (av (cdr lst))))))))


(av '(0 0 -1 -1 1 0 0 1 0)) ; -> (0 -1 -1 0 1 0 1 1)