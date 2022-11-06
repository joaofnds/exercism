(ns pov)

(defn filter-tree [x tree]
  (->> (tree-seq next rest tree)
       (filter #(some #{x} (flatten %)))
       not-empty))

(defn of [x tree]
  (some->> (filter-tree x tree)
           (reduce #(conj %2 (vec (remove #{%2} %1))))))

(defn path-from-to [f t tree]
  (some->> (of f tree)
           (filter-tree t)
           (mapv first)))
