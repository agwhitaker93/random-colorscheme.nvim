(let [M {:initial :random :colorschemes [] :background :auto :automatic-colorscheme-change false :party false}]
  (set M.setup (fn [opts]
                 (each [key value (pairs opts)]
                   (set (. M key) value))))
  M)
