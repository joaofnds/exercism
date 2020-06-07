(ns anagram)

(defn- anagram? [word candidate]
  (let [lower-word (.toLowerCase word)
        lower-candidate (.toLowerCase candidate)]
    (and
     (not= lower-word lower-candidate)
     (= (sort lower-word) (sort lower-candidate)))))

(defn anagrams-for [word prospect-list]
  (filter (partial anagram? word) prospect-list))
