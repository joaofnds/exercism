(ns change)

;;;; Greedy approach
(defn issue-greedy [amount coins]
  (loop [coins (sort (comp - compare) coins)
         change '()]
    (let [total (apply + change)
          coin (first coins)
          left (- amount total)]
      (println {:amount amount :coins coins :coin coin :change change :total total})
      (cond
        (empty? coins) (throw (IllegalArgumentException. "cannot change"))
        (= total amount) change
        (>= left coin) (recur coins (conj change coin))
        :else (recur (rest coins) change)))))

;;;; Dynamic programing approach
(def cache (atom {}))
(def min-by #(first (sort-by %1 %2)))

(defn store [amount [coins-used depth :as result]]
  (swap! cache assoc amount [coins-used depth])
  result)

(defn least-coins
  ([amount coins] (least-coins amount coins '() 0))
  ([amount coins coins-used depth]
   (let [cached (@cache amount)]
     (cond
       (and cached (>= depth (last cached))) cached
       (zero? amount) [coins-used depth]
       (neg? amount)  ['() Double/POSITIVE_INFINITY]
       :else (->> (map #(least-coins (- amount %) coins (conj coins-used %) (inc depth)) coins)
                  (min-by last)
                  (store amount))))))

(defn issue [amount coins]
  (if (zero? amount) '()
      (do
        (reset! cache {})
        (let [coins-used (first (least-coins amount (sort (comp - compare) coins)))]
          (if (empty? coins-used)
            (throw (IllegalArgumentException. "cannot change"))
            coins-used)))))
