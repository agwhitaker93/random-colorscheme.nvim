(let [M {:initial :random :colorschemes [] :override_telescope_picker false}]
  (set M.setup (fn [opts]
                 (each [key value (pairs opts)]
                   (set (. M key) value))))
  M)
