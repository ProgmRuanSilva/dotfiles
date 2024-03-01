---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
