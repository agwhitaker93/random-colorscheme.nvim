(let [M {:initial :random :colorschemes []}]
  (set M.setup (fn [opts]
                 (each [key value (pairs opts)]
                   (set (. M key) value))))
  M)
