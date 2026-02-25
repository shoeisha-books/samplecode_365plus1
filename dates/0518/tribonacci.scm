;; tribonacci.scm

;; 効率的なトリボナッチ数列の計算（末尾再帰）
(define (tribonacci n)
  (let loop ((i 0) (a 0) (b 0) (c 1))
    (cond
      ((= i n) a)
      (else (loop (+ i 1) b c (+ a b c))))))

;; iota関数（0からn-1のリストを正しい順序で生成）
(define (iota n)
  (let loop ((i 0) (result '()))
    (if (= i n)
        (reverse result)
        (loop (+ i 1) (cons i result)))))

;; 表示関数
(define (print-tribonacci count)
  (for-each
    (lambda (i)
      (display (tribonacci i))
      (display " "))
    (iota count))
  (newline))

;; 実行
(display "トリボナッチ数列\n")
(print-tribonacci 15)
(display "完了！\n")