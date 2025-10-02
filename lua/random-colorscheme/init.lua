-- [nfnl] lua/random-colorscheme/init.fnl
local function pick_random(colourschemes)
  do
    local date = os.date("*t")
    local year = date.year
    local month = date.month
    local day = date.day
    math.randomseed(os.time({year = year, month = month, day = day}))
  end
  do
    local random = math.random(#colourschemes)
    local colourscheme = colourschemes[random]
    _G.vim.cmd(("colorscheme " .. colourscheme))
  end
  return math.randomseed(os.time())
end
local config = require("random-colorscheme.config")
local finders = require("telescope.finders")
local telescope_config = require("telescope.config")
local function _1_(opts)
  local colourschemes = opts.colourschemes
  config.setup(opts)
  do
    local _2_ = config.initial
    if (_2_ == "random") then
      pick_random(colourschemes)
    elseif (_2_ == "environment") then
      _G.vim.cmd(("colorscheme " .. os.getenv("COLOURSCHEME")))
    else
      local _ = _2_
      _G.vim.cmd(("colorscheme " .. config.initial))
    end
  end
  if config.override_telescope_picker then
    telescope_config.pickers.colorscheme.finder = finders.new_table({results = config.colourschemes})
    return nil
  else
    return nil
  end
end
return {setup = _1_}
