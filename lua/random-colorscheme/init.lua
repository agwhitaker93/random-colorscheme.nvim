-- [nfnl] lua/random-colorscheme/init.fnl
local config = require("random-colorscheme.config")
local function get_light_or_dark_scheme(scheme)
  if (scheme.light and scheme.dark) then
    local case_1_ = config.background
    if (case_1_ == "auto") then
      local case_2_ = _G.vim.o.background
      if (case_2_ == "dark") then
        return scheme.dark
      elseif (case_2_ == "light") then
        return scheme.light
      else
        return nil
      end
    elseif (case_1_ == "dark") then
      return scheme.dark
    elseif (case_1_ == "light") then
      return scheme.light
    else
      return nil
    end
  else
    return scheme
  end
end
local function pick_random(colorschemes)
  if not config.party then
    local date = os.date("*t")
    local year = date.year
    local month = date.month
    local day = date.day
    math.randomseed(os.time({year = year, month = month, day = day}))
  else
  end
  do
    local random = math.random(#colorschemes)
    local colorscheme = colorschemes[random]
    local colorscheme0 = get_light_or_dark_scheme(colorscheme)
    _G.vim.cmd(("colorscheme " .. colorscheme0))
  end
  return math.randomseed(os.time())
end
local function schedule_colorscheme_change(config0)
  if config0["automatic-colorscheme-change"] then
    local function _7_()
      pick_random(config0.colorschemes)
      return schedule_colorscheme_change(config0)
    end
    local function _8_()
      if config0.party then
        return 1000
      else
        return 60000
      end
    end
    return _G.vim.defer_fn(_7_, _8_())
  else
    return nil
  end
end
local function setup_background_autocmd()
  local function _10_()
    pick_random(config.colorschemes)
    return schedule_colorscheme_change(config)
  end
  return _G.vim.api.nvim_create_autocmd("OptionSet", {group = _G.vim.api.nvim_create_augroup("RandomColourschemeBackgroundChange", {clear = true}), pattern = "background", callback = _10_})
end
local function _11_(opts)
  config.setup(opts)
  local case_12_ = config.initial
  if (case_12_ == "random") then
    pick_random(config.colorschemes)
    schedule_colorscheme_change(config)
    if (config.background == "auto") then
      return setup_background_autocmd()
    else
      return nil
    end
  elseif (case_12_ == "environment") then
    return _G.vim.cmd(("colorscheme " .. os.getenv("COLORSCHEME")))
  else
    local _ = case_12_
    return _G.vim.cmd(("colorscheme " .. config.initial))
  end
end
return {setup = _11_}
