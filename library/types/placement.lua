---@meta

---@class PlacementInfo
---@field name string The name of the placement. Used to look up human-readable text in the language file.
---@field placementType "point"|"line"|"rectangle"? Determines behaviour during placement. Will usually be guessed from other data.
---@field data table<string, MapSaveable> Key-value pairs of entity attributes. Each key specifies an attribute name and its value determines the default value that that attribute will have upon placement.