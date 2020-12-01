(ns protein-translation)

(def codon->protein
  {"AUG" "Methionine"
   "UUU" "Phenylalanine"
   "UUC" "Phenylalanine"
   "UUA" "Leucine"
   "UUG" "Leucine"
   "UCU" "Serine"
   "UCC" "Serine"
   "UCA" "Serine"
   "UCG" "Serine"
   "UAU" "Tyrosine"
   "UAC" "Tyrosine"
   "UGU" "Cysteine"
   "UGC" "Cysteine"
   "UGG" "Tryptophan"
   "UAA" "STOP"
   "UAG" "STOP"
   "UGA" "STOP"})

(defn translate-codon [codon]
  (codon->protein codon))

(defn translate-rna [rna]
  (->>
   (partition 3 rna)
   (map #(translate-codon (apply str %)))
   (take-while (partial not= "STOP"))))
