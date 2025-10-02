-- [nfnl] lua/random-colorscheme/init.fnl
local config = require("random-colorscheme.config")
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
local function override_telescope_picker()
  local config_ok, telescope_config = pcall(require, "telescope.config")
  local finders_ok, telescope_finders = pcall(require, "telescope.finders")
  if (config_ok and finders_ok) then
    telescope_config.pickers.colorscheme = _G.vim.tbl_deep_extend("error", (telescope_config.pickers.colorscheme or {}), {finder = telescope_finders.new_table({results = config.colourschemes})})
    return nil
  else
    return nil
  end
end
local function _2_(opts)
  local colourschemes = opts.colourschemes
  config.setup(opts)
  do
    local _3_ = config.initial
    if (_3_ == "random") then
      pick_random(colourschemes)
    elseif (_3_ == "environment") then
      _G.vim.cmd(("colorscheme " .. os.getenv("COLOURSCHEME")))
    else
      local _ = _3_
      _G.vim.cmd(("colorscheme " .. config.initial))
    end
  end
  if config.override_telescope_picker then
    return override_telescope_picker()
  else
    return nil
  end
end
return {setup = _2_}
