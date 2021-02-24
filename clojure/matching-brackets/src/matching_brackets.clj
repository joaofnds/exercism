(ns matching-brackets)

(def opening->closing {\( \) \[ \] \{ \}})

(defn valid? [string]
  (loop [[x & xs] (apply list string)
         [h & tail :as stack] (list)]
    (cond
      (nil? x) (empty? stack)
      (contains? opening->closing x) (recur xs (conj stack (opening->closing x)))
      (= x h) (recur xs tail)
      (.contains (vals opening->closing) x) false
      :else (recur xs stack))))
