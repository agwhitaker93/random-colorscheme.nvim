# random-colorscheme.nvim

Pick a random colorscheme every day

## Example lazy.nvim usage

```lua
return {
  "agwhitaker93/random-colorscheme.nvim",
  priority = 2000,
  lazy = false,
  dependencies = {
    {
      "miikanissi/modus-themes.nvim",
      opts = function()
        return {
          on_highlights = function(highlights, colors)
            highlights.CursorLine = { fg = colors.none, bg = colors.bg_dim }
            highlights.CursorLineNr = { fg = colors.cyan_intense, bg = colors.bg_dim, bold = true }
            highlights.LineNr = { fg = colors.fg_dim, bg = colors.bg_main }
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
    colorschemes = {
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

You can optionally provide a map of light/dark theme pairs.
Not necessary for colorschemes that support both dark and light modes, like modus, oxocarbon, etc.

```lua
{
  opts = {
    colorschemes = {
      "modus",
      { light = "cyberdream-light", dark = "cyberdream" },
      { light = "my light theme", dark = "my unrelated dark theme" }
    }
  },
}
```
