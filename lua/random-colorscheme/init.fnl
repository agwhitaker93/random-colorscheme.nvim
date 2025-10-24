(local config (require :random-colorscheme.config))

(fn pick-random [colorschemes]
  (let [date (os.date :*t)
        year date.year
        month date.month
        day date.day]
    (math.randomseed (os.time {: year : month : day})))
  (let [random (math.random (length colorschemes))
        colorscheme (. colorschemes random)]
    (_G.vim.cmd (.. "colorscheme " colorscheme)))
  (math.randomseed (os.time)))

{:setup (fn [opts]
          (let [colorschemes (. opts :colorschemes)]
            (config.setup opts)
            (case config.initial
              :random (pick-random colorschemes)
              :environment (_G.vim.cmd (.. "colorscheme "
                                           (os.getenv :COLOURSCHEME)))
              _ (_G.vim.cmd (.. "colorscheme " config.initial)))))}
