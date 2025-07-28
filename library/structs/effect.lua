---@meta structs.effect

---@class Effect : Style
---@field _type "effect"

local effectStruct = {}

---@param data PackedElement
---@return Effect
function effectStruct.decode(data) end

---@param effect Effect
---@return PackedElement
function effectStruct.encode(effect) end

return effectStruct