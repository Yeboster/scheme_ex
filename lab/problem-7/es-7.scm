;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname es-7) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define belong?
  (lambda (n lst)
    (cond ((null? lst) #f)
          ((= (car lst) n) #t)
          (else (belong? n (cdr lst)))
    )))

(define position
  (lambda (n lst)
    (cond ((null? lst) (- n))
          ((= (car lst) n) 0)
          (else (+ 1 (position n (cdr lst)))))))

(define sorted-ins
  (lambda (n lst)
    (cond ((null? lst) (cons n null))
          ((< n (car lst)) (cons n lst))
          ((= n (car lst)) lst)
          (else (cons (car lst) (sorted-ins n (cdr lst)))))))

(define sorted-list-rec-tail
  (lambda (lst sorted)
    (cond ((null? lst) sorted)
          (else (cons (car lst) (sorted-list (cdr lst)))))))

; Prototipe not working :(
; (define sorted-list
;   (lambda (lst)
;     (if (null? lst)
;       null
;       (let ((fst (car lst)) (fst-sorted (sorted-ins (car lst) (cdr lst))))
;         (if (= (position fst fst-sorted) 0) 
;           (cons fst (sorted-list (cdr lst)))
;           (sorted-list fst-sorted)
;         )))))

(define sorted-list
  (lambda (lst)
    (if (null? lst)
        null
        (sorted-ins (car lst) (sorted-list (cdr lst))))))

(sorted-list '(35 8 41 24 7))
