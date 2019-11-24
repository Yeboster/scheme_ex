;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname l-tassellation) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define L-rot-r ; Tile right-top
  (lambda (image right-steps)
    (shift-right (quarter-turn-right image) right-steps)))

(define L-rot-l ; Tile left-down
  (lambda (image down-steps)
    (shift-down (quarter-turn-left image) down-steps)))

(define L-normal ; Tile left-down
  (lambda (image down-steps right-steps)
    (shift-down (shift-right image right-steps) down-steps)))

(set-tessellation-shift-step!) ; Needed to fix shift procedures with L-tile
(define L-tessellation ; val: image of L-tile
  (lambda (n)          ; n: n % 2 == 0 => size of the image
    (let ((n/2 (/ n 2)) (glue (lambda (t t1) (glue-tiles t t1))))
      (if (= n 1)
        L-tile
        (glue (L-normal (L-tessellation n/2) n/2 n/2)
              (glue (L-rot-l (L-tessellation n/2) n)
                    (glue (L-tessellation n/2) (L-rot-r (L-tessellation n/2) n))))))))

; (quarter 2 2)
(L-tessellation 4)
; (glue
;  L-tile
;  (shift-down (shift-right L-tile 1) 1)
;  )
