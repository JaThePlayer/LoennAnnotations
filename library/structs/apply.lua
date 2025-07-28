---@meta structs.apply

---@class Apply : Style
---@field _type "apply"
---@field _name? string In-editor display name.
---@field children Style[] Inner styles contained by this Apply
local Apply = {}

local applyStruct = {}

---@param data PackedElement
---@return Apply
function applyStruct.decode(data) end

---@param apply Apply
---@return PackedElement
function applyStruct.encode(apply) end

return applyStruct