(ns interest-is-interesting)

(defn interest-rate
  [balance]
  (condp <= balance
    5000 2.475
    1000 1.621
    0    0.5
    -3.213))

(defn annual-balance-update
  [balance]
  (let [rate (/ (interest-rate balance) 100.0M)
        yield (* balance rate)]
    (bigdec (+ balance yield))))

(defn amount-to-donate
  [balance tax-free-percentage]
  (int (* (max 0 balance) (/ tax-free-percentage 50.0))))
