;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname first) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define closest-pair-rec ; tuple float
    (lambda (l t) ; l: list float ; t: tuple float
        (let ((smaller? (lambda (t1 t2) 
                            (if (< (abs (- (car t1) (cadr t1))) (abs (- (car t2) (cadr t2)))) #t #f))))
            (cond ((= (length l) 2) (if (smaller? l t) l t))
                  ((smaller? (list (car l) (cadr l)) t) (closest-pair-rec (cdr l) (list (car l) (cadr l))))
                  (else (closest-pair-rec (cdr l) t))))))

(define closest-pair 
    (lambda (l)
        (closest-pair-rec l (list (car l) (cadr l)))))

(closest-pair '(0.1 0.3 0.5 0.6 0.8 1.1)) ; -> (list 0.5 0.6)
