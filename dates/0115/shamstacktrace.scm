;; stack-trace.scm

(define (factorial n)
  (let loop ((current-n n) (trace '()))
    (display (string-append "call: factorial(" (number->string current-n) ")\n"))
    (let ((trace (cons current-n trace)))
      (if (= current-n 0)
          (begin
            (display "return: 1\n")
            (display (string-append "Trace: " (number->string (car trace)) "\n"))
            1)
          (let ((result (* current-n (loop (- current-n 1) trace))))
            (display (string-append "return: " (number->string result) "\n"))
            (display (string-append "Trace: " (number->string (car trace)) "\n"))
            result)))))

(display "擬似スタックトレース\n")
(define result (factorial 5))
(display (string-append "Final result: " (number->string result) "\n"))
(display "完了！\n")