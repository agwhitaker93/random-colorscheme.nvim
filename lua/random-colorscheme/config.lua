-- [nfnl] lua/random-colorscheme/config.fnl
local M = {initial = "random", colorschemes = {}, light = {}, dark = {}}
local function _1_(opts)
  for key, value in pairs(opts) do
    M[key] = value
  end
  return nil
end
M.setup = _1_
return M
