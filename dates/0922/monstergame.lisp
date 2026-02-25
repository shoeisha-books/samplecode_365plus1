;;; monster-game.lisp
;;; ランダムモンスター生成ゲーム

(defun rand-range (min max) (+ min (random (+ 1 (- max min)))))

(defparameter *monsters* '("Slime" "Goblin" "Orc" "Dragon"))

(defun gen-monster ()
  (let ((name (nth (random (length *monsters*)) *monsters*))
        (hp (rand-range 5 20))
        (atk (rand-range 1 5)))
    (list name hp atk)))

(defun fight (monster)
  (destructuring-bind (name hp atk) monster
    (format t "~%A wild ~a appears! HP: ~a, ATK: ~a~%" "" name hp atk)
    (loop while (> hp 0)
          do (let ((damage (rand-range 1 5)))
               (setf hp (- hp damage))
               (format t "You hit ~a for ~a damage! Remaining HP: ~a~%" name damage (max hp 0))))
    (format t "~a is defeated!~%" name)))

;;; 実行
(format t "Welcome to Monster Game!~%")
(loop repeat 3
      do (fight (gen-monster)))
(format t "You survived the encounters!~%")
