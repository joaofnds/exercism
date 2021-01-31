(ns proverb
  (:require [clojure.string :as str]))

(defn recite [[first-object & _ :as objects]]
  (if (empty? objects) ""
      (let [line (fn [[s1 s2]] (str "For want of a " s1 " the " s2 " was lost."))
            last-line (str "And all for the want of a " first-object ".")]
        (->> (partition 2 1 objects)
             (mapv line)
             (#(conj % last-line))
             (str/join "\n")))))
