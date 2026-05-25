---@meta

---@class WrappedList : WrappedMap
---@field ltype "list"
---@field islist true
---@overload fun(): any[] Returns the underlying lua table.
---@field [integer] any
local WrappedList = {}

---@class WrappedListString : WrappedList
---@overload fun(): string[] Returns the underlying lua table.
---@field [integer] string
local WrappedListString = {}