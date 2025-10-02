# random-colorscheme.nvim

Pick a random colorscheme every day

## Example lazy.nvim usage

```lua
return {
  "agwhitaker93/random-colorscheme.nvim",
  priority = 2000,
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    {
      "miikanissi/modus-themes.nvim",
      opts = function()
        return {
          on_highlights = function(highlights, colours)
            highlights.CursorLine = { fg = colours.none, bg = colours.bg_dim }
            highlights.CursorLineNr = { fg = colours.cyan_intense, bg = colours.bg_dim, bold = true }
            highlights.LineNr = { fg = colours.fg_dim, bg = colours.bg_main }
          end,
        }
      end,
      lazy = false,
    },
    "zootedb0t/citruszest.nvim",
    "nyngwang/nvimgelion",
  },
  opts = {
    initial = "random", -- Can be set to a colorscheme to always pick the same one
    colourschemes = {
      "citruszest",
      "modus",
      "nvimgelion",
      "sorbet",
      "torte",
      "wildcharm",
    },
    override_telescope_picker = true, -- Will replace telescope's colorscheme list with the ones you specified here
  },
  keys = {
    { "<leader>sC", "<CMD>Telescope colorscheme<CR>", desc = "Colourscheme picker" },
  },
}
```
