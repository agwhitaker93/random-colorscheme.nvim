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
  },
}
```

## Light and dark colorschemes

If you provide arrays of light and dark colorschemes during setup, it will pick a random scheme from the relevant list based on `vim.o.background`

If a colorscheme has both a light and dark mode, putting them at the same index in each array will switch between them when `vim.o.background` changes

### Example config

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
    initial = "random",
    light = {
      "delek",
      "modus_operandi",
    },
    dark = {
      "citruszest",
      "modus_vivendi",
      "nvimgelion",
      "sorbet",
      "torte",
      "wildcharm",
    },
  },
}
```
