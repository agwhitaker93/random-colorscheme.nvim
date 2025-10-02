(local config (require :random-colorscheme.config))

(fn pick-random [colourschemes]
  (let [date (os.date :*t)
        year date.year
        month date.month
        day date.day]
    (math.randomseed (os.time {: year : month : day})))
  (let [random (math.random (length colourschemes))
        colourscheme (. colourschemes random)]
    (_G.vim.cmd (.. "colorscheme " colourscheme)))
  (math.randomseed (os.time)))

(fn override-telescope-picker []
  (local (config-ok telescope-config) (pcall require :telescope.config))
  (local (finders-ok telescope-finders) (pcall require :telescope.finders))
  (if (and config-ok finders-ok)
      (set telescope-config.pickers.colorscheme
           (_G.vim.tbl_deep_extend :error
                                   (or telescope-config.pickers.colorscheme {})
                                   {:finder (telescope-finders.new_table {:results config.colourschemes})}))))

{:setup (fn [opts]
          (let [colourschemes (. opts :colourschemes)]
            (config.setup opts)
            (case config.initial
              :random (pick-random colourschemes)
              :environment (_G.vim.cmd (.. "colorscheme "
                                           (os.getenv :COLOURSCHEME)))
              _ (_G.vim.cmd (.. "colorscheme " config.initial)))
            (if config.override_telescope_picker
                (override-telescope-picker))))}
