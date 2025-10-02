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

(let [config (require :random-colorscheme.config)
      finders (require :telescope.finders)
      telescope-config (require :telescope.config)]
  {:setup (fn [opts]
            (let [colourschemes (. opts :colourschemes)]
              (config.setup opts)
              (case config.initial
                :random (pick-random colourschemes)
                :environment (_G.vim.cmd (.. "colorscheme "
                                             (os.getenv :COLOURSCHEME)))
                _ (_G.vim.cmd (.. "colorscheme " config.initial)))
              (if config.override_telescope_picker ; TODO: check if telescope is even available
                  (set telescope-config.pickers.colorscheme.finder
                       (finders.new_table {:results config.colourschemes})))))})
