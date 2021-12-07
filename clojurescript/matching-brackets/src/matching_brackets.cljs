(ns matching-brackets)

(def opening->closing {\( \) \[ \] \{ \}})

(defn opening? [char]
  (contains? opening->closing char))

(defn closing? [char]
  (some #{char} (vals opening->closing)))

(defn valid? [string]
  (loop [[x & xs] (apply list string)
         [h & tail :as stack] (list)]
    (cond
      (nil? x) (empty? stack)
      (= x h) (recur xs tail)
      (opening? x) (recur xs (conj stack (opening->closing x)))
      (closing? x) false
      :else (recur xs stack))))
