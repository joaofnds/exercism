(ns all-your-base)

(defn- pow [a b]
  (reduce * 1 (repeat b a)))

(defn- floor
  ([a] (floor a 1))
  ([a divisor] (int (Math/floor (/ a divisor)))))

(defn- to-base-10 [digits base]
  (->> (reverse digits)
       (map-indexed #(* %2 (pow base %1)))
       (apply +)))

(defn- from-base-10 [number base]
  (loop [digits '()
         n number]
    (println)
    (if (pos? n)
      (recur (conj digits (rem n base))
             (floor n base))
      (if (empty? digits)
        '(0)
        digits))))

(defn- valid-base-conversion? [digits from-base to-base]
  (and (> from-base 1)
       (> to-base 1)
       (pos? (count digits))
       (every? #(> from-base % -1) digits)))

(defn convert [from-base digits to-base]
  (if (valid-base-conversion? digits from-base to-base)
    (-> digits
        (to-base-10 from-base)
        (from-base-10 to-base))))
