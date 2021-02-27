(ns bank-account)

(defn open-account []
  (atom 0))

(defn close-account [acc]
  (reset! acc nil))

(defn get-balance [acc]
  @acc)

(defn update-balance [acc amount]
  (swap! acc + amount))
