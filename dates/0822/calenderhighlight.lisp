;;; calendar-safe.lisp
;;; UTF-8 安全版カレンダー（祝日英語表記）
;;; CLISP で文字化けや EILSEQ エラーを防止

;; UTF-8 を使用
(setf *default-external-format* :utf-8)

(defun days-in-month (year month)
  "指定月の日数（うるう年対応）"
  (case month
    ((1 3 5 7 8 10 12) 31)
    ((4 6 9 11) 30)
    (2 (if (and (zerop (mod year 4))
                (or (not (zerop (mod year 100)))
                    (zerop (mod year 400)))) 29 28))))

(defun first-day-of-month (year month)
  "指定月1日の曜日を返す (0=日曜..6=土曜)"
  (multiple-value-bind (sec min hour day mon yr weekday dst zone)
      (decode-universal-time (encode-universal-time 0 0 0 1 month year))
    weekday))

(defun holidays-in-month (year month)
  "祝日のリストを返す (日付 名称) 英語表記、ASCIIのみ使用"
  (let ((h '()))
    ;; Fixed holidays
    (when (= month 1) (push (list 1 "NYD") h))           ; New Year's Day
    (when (= month 5)
      (push (list 3 "Constitution") h)
      (push (list 4 "Greenery") h)
      (push (list 5 "Children") h))
    (when (= month 11)
      (push (list 3 "Culture") h)
      (push (list 23 "Labor") h))
    h))

(defun print-calendar (year month)
  "カレンダーを表示し、祝日は*でマーク"
  (let* ((days (days-in-month year month))
         (start (first-day-of-month year month))
         (holidays (holidays-in-month year month)))
    (format t "~%~8t~a Year ~a Month~%" year month)
    (format t "Su Mo Tu We Th Fr Sa~%")
    ;; 最初の空白
    (dotimes (i start) (format t "   "))
    (loop for day from 1 to days
          for pos from start
          do (format t "~2d~a " day (if (assoc day holidays :test #'=) "*" ""))
             (when (= (mod (1+ pos) 7) 0) (format t "~%")))))

;;; 実行
(let* ((year 0) (month 0))
  (format t "Enter year: ")
  (setf year (parse-integer (read-line)))
  (format t "Enter month: ")
  (setf month (parse-integer (read-line)))
  (print-calendar year month)
  (format t "~%Finished~%"))
