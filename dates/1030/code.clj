;;; 因数分解をする関数
(defn pfac [n]
    (loop [d 2, n n, acc '()]
    (cond
        ;; nが1になったらaccを返す
        (= n 1) acc
        ;; nがdで割り切れるならdをaccに追加し、nをn/d、dを2にしてループを継続する
        (= 0 (rem n d)) (recur 2 (/ n d) (cons d acc))
        ;; それ以外はdを+1してループを継続する
        :else (recur (inc d) n acc))))

(println (pfac 40))     ; => (5 2 2 2)
(println (pfac 1986))   ; => (331 3 2)
(println (pfac 2026))   ; => (1013 2)
