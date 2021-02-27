(ns bank-account)

(defn open-account []
  (atom 0))

(defn close-account [acc]
  (reset! acc nil)
  acc)

(defn get-balance [acc]
  (when-not (nil? @acc)
    @acc))

(defn update-balance [acc amount]
  (swap! acc + amount)
  acc)
