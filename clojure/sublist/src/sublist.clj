(ns sublist)

(defn sublist? [seq1 seq2]
  (some #{seq1} (partition (count seq1) 1 seq2)))

(defn classify [list1 list2]
  (cond
    (= list1 list2) :equal
    (sublist? list1 list2) :sublist
    (sublist? list2 list1) :superlist
    :else :unequal))
