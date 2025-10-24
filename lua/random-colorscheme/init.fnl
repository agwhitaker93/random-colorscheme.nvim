(local config (require :random-colorscheme.config))

(fn pick-random [colorschemes]
  (let [date (os.date :*t)
        year date.year
        month date.month
        day date.day]
    (math.randomseed (os.time {: year : month : day})))
  (let [random (math.random 10000) ; NOTE: pick a really big number, we'll modulo it
        colorscheme (. colorschemes (% random (length colorschemes)))]
    (_G.vim.cmd (.. "colorscheme " colorscheme)))
  (math.randomseed (os.time)))

(fn setup-background-autocmd []
  (_G.vim.api.nvim_create_autocmd :OptionSet
                                  {:group (_G.vim.api.nvim_create_augroup :RandomColourschemeBackgroundChange
                                                                          {:clear true})
                                   :pattern :background
                                   :callback (fn []
                                               (_G.vim.print "Detected background change, picking new scheme")
                                               (pick-random (case _G.vim.o.background
                                                              :dark config.dark
                                                              :light config.light)))}))

{:setup (fn [opts]
          (let [colorschemes (. opts :colorschemes)
                light (. opts :light)
                dark (. opts :dark)]
            (config.setup opts)
            (case config.initial
              :random (if (and light dark)
                          nil ; NOTE: vim.o.background hasn't been set yet, so do nothing and let the autocmd handle it
                          (pick-random colorschemes))
              :environment (_G.vim.cmd (.. "colorscheme "
                                           (os.getenv :COLORSCHEME)))
              _ (_G.vim.cmd (.. "colorscheme " config.initial)))
            (if (and light dark)
                (setup-background-autocmd))))}
