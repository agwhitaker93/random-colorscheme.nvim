(let [M {:initial :random :colorschemes [] :background :auto}]
  (set M.setup (fn [opts]
                 (each [key value (pairs opts)]
                   (set (. M key) value))))
  M)
