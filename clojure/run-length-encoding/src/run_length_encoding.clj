(ns run-length-encoding)

(defn decode-letter
  [n letter]
  (apply str (repeat n letter)))

(defn encode-letter
  [initial-out n letter]
  (if (> n 1)
    (str initial-out n letter)
    (str initial-out letter)))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (let [last-char (atom nil)
        count (atom 0)
        out (atom "")]
    (doseq [char plain-text]
      (if (= char @last-char)
        (swap! count inc)
        (do
          (swap! out #(encode-letter % @count @last-char))
          (reset! last-char char)
          (reset! count 1))))
    (swap! out #(encode-letter % @count @last-char))
    @out))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (let [out (atom "")
        count (atom "")]
    (doseq [char cipher-text]
      (if (Character/isDigit char)
        (swap! count #(str % char))
        (do
          (swap! out #(str % (decode-letter (if (= @count "") 1 (Integer/parseInt @count)) char)))
          (reset! count ""))))
    @out))
