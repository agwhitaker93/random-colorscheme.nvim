-- [nfnl] custom-plugins/colourscheme.nvim/lua/colourscheme/config.fnl
local M = {initial = "random", colourschemes = {}, override_telescope_picker = false}
local function _1_(opts)
  for key, value in pairs(opts) do
    M[key] = value
  end
  return nil
end
M.setup = _1_
return M
