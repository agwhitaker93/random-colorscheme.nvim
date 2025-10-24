(let [M {:initial :random :colorschemes [] :light [] :dark []}]
  (set M.setup (fn [opts]
                 (each [key value (pairs opts)]
                   (set (. M key) value))))
  M)
