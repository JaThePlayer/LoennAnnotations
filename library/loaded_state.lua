---@meta loaded_state

local state = {}

state.currentSaves = {}
state.pendingSaves = {}

---Calls before save functions
---@param filename string
---@param state any
function state.defaultBeforeSaveCallback(filename, state) end

---Updates state filename and flags history with no changes
---@param filename string
---@param state any
function state.defaultAfterSaveCallback(filename, state) end

function state.defaultVerifyErrorCallback(filename) end

--- Check that the target file can be loaded again
---@param filename string
---@param successCallback fun()
---@param errorCallback fun(filename: string)
function state.verifyFile(filename, successCallback, errorCallback) end

---@param filename string
---@return string
function state.getTemporaryFilename(filename)
    return filename .. ".saving"
end

---@param filename string
---@param roomName string
function state.loadFile(filename, roomName) end

function state.saveFile(filename, afterSaveCallback, beforeSaveCallback, addExtIfMissing, verifyMap) end

---@param item any
---@param add boolean
function state.selectItem(item, add) end

---@return Room|false
function state.getSelectedRoom()
    return state.selectedItemType == "room" and state.selectedItem or false
end

---@return Filler|false
function state.getSelectedFiller()
    return state.selectedItemType == "filler" and state.selectedItem or false
end

---@return any selectedItem
---@return string itemType
function state.getSelectedItem()
    return state.selectedItem, state.selectedItemType
end

---@param item any
---@return boolean
function state.isItemSelected(item)
    if state.selectedItem == item then
        return true

    elseif state.selectedItemType == "table" then
        return not not state.selectedItemType[item]
    end

    return false
end

function state.openMap() end

function state.newMap() end

function state.saveAsCurrentMap(afterSaveCallback, beforeSaveCallback, addExtIfMissing) end

function state.saveCurrentMap(afterSaveCallback, beforeSaveCallback, addExtIfMissing) end

---@param name string
---@return Room?
---@return integer? roomIndex
function state.getRoomByName(name)
    local rooms = state.map and state.map.rooms or {}
    local nameWithLvl = "lvl_" .. name

    for i, room in ipairs(rooms) do
        if room.name == name or room.name == nameWithLvl then
            return room, i
        end
    end
end

function state.initFromPersistence() end

---@param layer string
---@param key string
---@param default any
---@return any
function state.getLayerInformation(layer, key, default) end

---@param layer string
---@param key string
---@param value any
---@return boolean changed
function state.setLayerInformation(layer, key, value) end

function state.clearRoomRenderCache() end

---@param layer string
---@return boolean
function state.getLayerShouldRender(layer) end

---@param layer string
---@param currentValue any
---@param otherValue any
function state.setLayerForceRender(layer, currentValue, otherValue) end

---@param layer string
---@return boolean
function state.getLayerVisible(layer)
    return state.getLayerInformation(layer, "visible", true)
end

---@param layer string
---@param visible boolean
---@param silent boolean
function state.setLayerVisible(layer, visible, silent) end

---@param layer string
---@param value boolean
function state.setShowDependendedOnMods(layer, value) end

---@param layer string
---@return boolean
function state.getShowDependedOnMods(layer)
    return state.onlyShowDependedOnMods[layer] or false
end

---The currently loaded map
---@type Map?
state.map = nil

---The currently selected item (room or filler)
state.selectedItem = nil

---@type string?
state.selectedItemType = nil

-- The viewport for the map renderer
---@type Viewport
state.viewport = nil

--- Rendering information about layers
state.layerInformation = {}

--- Hide content that is not in Everest.yaml
state.onlyShowDependedOnMods = {}

-- Map rendering
---@type boolean
state.showRoomBorders = true
---@type boolean
state.showRoomBackground = true

return state