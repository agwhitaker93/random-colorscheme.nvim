-- [nfnl] lua/random-colorscheme/init.fnl
local config = require("random-colorscheme.config")
local function pick_random(colorschemes)
  do
    local date = os.date("*t")
    local year = date.year
    local month = date.month
    local day = date.day
    math.randomseed(os.time({year = year, month = month, day = day}))
  end
  do
    local random = math.random(10000)
    local colorscheme = colorschemes[(random % #colorschemes)]
    _G.vim.cmd(("colorscheme " .. colorscheme))
  end
  return math.randomseed(os.time())
end
local function setup_background_autocmd()
  local function _1_()
    local function _3_()
      local _2_ = _G.vim.o.background
      if (_2_ == "dark") then
        return config.dark
      elseif (_2_ == "light") then
        return config.light
      else
        return nil
      end
    end
    return pick_random(_3_())
  end
  return _G.vim.api.nvim_create_autocmd("OptionSet", {group = _G.vim.api.nvim_create_augroup("RandomColourschemeBackgroundChange", {clear = true}), pattern = "background", callback = _1_})
end
local function _5_(opts)
  local colorschemes = opts.colorschemes
  local light = opts.light
  local dark = opts.dark
  config.setup(opts)
  do
    local _6_ = config.initial
    if (_6_ == "random") then
      if (light and dark) then
      else
        pick_random(colorschemes)
      end
    elseif (_6_ == "environment") then
      _G.vim.cmd(("colorscheme " .. os.getenv("COLORSCHEME")))
    else
      local _ = _6_
      _G.vim.cmd(("colorscheme " .. config.initial))
    end
  end
  if (light and dark) then
    return setup_background_autocmd()
  else
    return nil
  end
end
return {setup = _5_}
