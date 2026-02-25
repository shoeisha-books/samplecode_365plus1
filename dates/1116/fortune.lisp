;;; fortune-once-fixed.lisp
;;; 今日の運勢サトリます

(defparameter *fortunes*
  '("Great luck" "Good luck" "Average" "Bad luck" "Terrible"))

(defparameter *advice*
  '("Take a chance!" "Be careful today." "Relax and enjoy." "Focus on work." "Avoid risks."))

(defun gen-fortune ()
  "今日の運勢を占う"
  (let* ((index (random (length *fortunes*)))
         (fortune (nth index *fortunes*))
         (tip (nth index *advice*)))
    (format t "~%Your fortune: ~a~%" fortune)
    (format t "Advice: ~a~%" tip)))

;;; 実行
(format t "Welcome to Mini Fortune App!~%")
(gen-fortune)
(format t "Have a nice day!~%")