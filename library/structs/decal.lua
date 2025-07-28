---@meta structs.decal

---@class Decal
---@field _type "decal"
---@field texture string
---@field x number
---@field y number
---@field scaleX number
---@field scaleY number
---@field rotation number
---@field color string
---@field _editorLayer number
---@field depth? number
local Decal = {}

local decalStruct = {}

---Replace \ with /, remove .png and prefix with `decals/`
---@param texture string
---@return string
function decalStruct.decodeDecalTexture(texture)
    return "decals/" .. texture:gsub("\\", "/"):sub(1, #texture - 4)
end

---Strip decals/ and add .png
---@param texture string
---@return string
function decalStruct.encodeDecalTexture(texture)
    return texture:match("^decals/(.*)") .. ".png"
end

---@param data PackedElement
---@return Decal
function decalStruct.decode(data) end

---@param decal Decal
---@return PackedElement
function decalStruct.encode(decal) end

return decalStruct