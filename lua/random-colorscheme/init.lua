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
    local random = math.random(#colorschemes)
    local colorscheme = colorschemes[random]
    _G.vim.cmd(("colorscheme " .. colorscheme))
  end
  return math.randomseed(os.time())
end
local function _1_(opts)
  local colorschemes = opts.colorschemes
  config.setup(opts)
  local _2_ = config.initial
  if (_2_ == "random") then
    return pick_random(colorschemes)
  elseif (_2_ == "environment") then
    return _G.vim.cmd(("colorscheme " .. os.getenv("COLOURSCHEME")))
  else
    local _ = _2_
    return _G.vim.cmd(("colorscheme " .. config.initial))
  end
end
return {setup = _1_}
