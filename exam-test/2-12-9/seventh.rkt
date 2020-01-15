;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname first) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
#|WHEN USING LISTS,
 THE BASE CASE SHOULD BE WITH AN EMPTY LIST
 NOT WITH THE LAST ELEMENT.
 WITH THIS APPROACH IT'S FULLY WORKING
 BUT YOU CANNOT USE CAR IN LET CONSTRUCT!
|# 

(define shared ; list
    (lambda (l1 l2) ; l1: T l2: T
        (let ((bigger  (lambda (a b) (if (< (length a) (length b)) b a))))
            (cond ((or (= (length l1) 0) (= (length l2) 0)) null)
                  ((= (car l1) (car l2)) (cons (car l1) (shared (cdr l1) (cdr l2))))
                  (else (bigger (shared (cdr l1) l2) (shared l1 (cdr l2))))))))

(shared '(1 3 5 6 7 8 9 10) '(0 1 2 3 4 5 7 9)) ; -> (1 3 5 7 9)