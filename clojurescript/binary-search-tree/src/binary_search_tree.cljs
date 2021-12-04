(ns binary-search-tree)

(defn singleton [x]
  [x nil nil])

(defn value [node]
  (nth node 0))

(defn left [node]
  (nth node 1))

(defn right [node]
  (nth node 2))

(defn insert [x node]
  (cond
    (nil? node) (singleton x)
    (<= x (value node)) (assoc node 1 (insert x (left node)))
    (> x (value node)) (assoc node 2 (insert x (right node)))))

(defn to-list [node]
  (if (nil? node)
    []
    (concat
     (to-list (left node))
     [(value node)]
     (to-list (right node)))))

(defn from-list [[x & xs]]
  (reduce #(insert %2 %1) (singleton x) xs))
