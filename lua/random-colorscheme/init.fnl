(local config (require :random-colorscheme.config))

(fn get-light-or-dark-scheme [scheme]
  (if (and scheme.light scheme.dark)
      (case config.background
        :auto (case _G.vim.o.background
                :dark scheme.dark
                :light scheme.light)
        :dark scheme.dark
        :light scheme.light)
      scheme))

(fn pick-random [colorschemes]
  (let [date (os.date :*t)
        year date.year
        month date.month
        day date.day]
    (math.randomseed (os.time {: year : month : day})))
  (let [random (math.random (length colorschemes))
        colorscheme (. colorschemes random)
        colorscheme (get-light-or-dark-scheme colorscheme)]
    (_G.vim.cmd (.. "colorscheme " colorscheme)))
  (math.randomseed (os.time)))

(fn setup-background-autocmd []
  (_G.vim.api.nvim_create_autocmd :OptionSet
                                  {:group (_G.vim.api.nvim_create_augroup :RandomColourschemeBackgroundChange
                                                                          {:clear true})
                                   :pattern :background
                                   :callback (fn []
                                               (pick-random config.colorschemes))}))

{:setup (fn [opts]
          (config.setup opts)
          (case config.initial
            :random (if (= config.background :auto)
                        (setup-background-autocmd)
                        (pick-random config.colorschemes))
            :environment (_G.vim.cmd (.. "colorscheme "
                                         (os.getenv :COLORSCHEME)))
            _ (_G.vim.cmd (.. "colorscheme " config.initial))))}
