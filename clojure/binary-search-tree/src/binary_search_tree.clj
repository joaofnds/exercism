(ns binary-search-tree)

(defn singleton [number]
  [number nil nil])

(defn value [node]
  (nth node 0))

(defn left [node]
  (nth node 1))

(defn right [node]
  (nth node 2))

(defn insert [number node]
  (cond
    (nil? node) (singleton number)
    (<= number (value node)) (assoc node 1 (insert number (left node)))
    (> number (value node))  (assoc node 2 (insert number (right node)))))

(defn to-list [node]
  (if (nil? node)
    []
    (concat
     (to-list (left node))
     [(value node)]
     (to-list (right node)))))

(defn from-list [[x & xs]]
  (reduce #(insert %2 %1) (singleton x) xs))
