;; perfect-numbers.scm

;; iota関数を先に定義し、1からnまでのリストを生成するように修正
(define (iota n)
  (let loop ((i 1) (result '()))
    (if (> i n)
        (reverse result)
        (loop (+ i 1) (cons i result)))))

;; 自身の約数の和を計算
(define (sum-divisors n)
  (let ((divs (filter (lambda (x) (= (remainder n x) 0)) (iota (- n 1)))))
    (apply + divs)))

;; 完全数か判定（自身の約数の和が自身と等しいか）
(define (perfect? n)
  (and (> n 0) (= (sum-divisors n) n)))

;; 実行
(for-each (lambda (x) (if (perfect? x) (display (string-append (number->string x) "\n")) #f)) (iota 1000))

(display "✅ 完了！\n")