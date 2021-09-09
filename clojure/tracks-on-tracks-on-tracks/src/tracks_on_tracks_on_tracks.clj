(ns tracks-on-tracks-on-tracks)

(defn new-list
  "Creates an empty list of languages to practice."
  []
  (list))

(defn add-language
  "Adds a language to the list."
  [lang lang-list]
  (cons lang lang-list))

(defn first-language
  "Returns the first language on the list."
  [lang-list]
  (peek lang-list))

(defn remove-language
  "Removes the the last language added to the list."
  [lang-list]
  (rest lang-list))

(defn count-languages
  "Returns the total number of languages on the list."
  [lang-list]
  (count lang-list))

(defn learning-list
  "Creates an empty list, adds Clojure and Lisp, removes Lisp, adds
  Java and JavaScript, then finally returns a count of the total number
  of languages."
  []
  (->> (new-list)
       (add-language "Clojure")
       (add-language "Lisp")
       (remove-language)
       (add-language "Java")
       (add-language "JavaScript")
       (count)))
