# Lönn Type Annotations

Provides (currently incomplete) lua type annotations for [Lönn](https://github.com/CelestialCartographers/Loenn), for use as an Addon for the [Lua Language Server](https://luals.github.io/) VSCode extension.

**These annotations are NOT official, and NOT created by the Lönn developers. Errors in these annotations should not be reported to the Lönn developers.**

## Installation
0. Install the [Lua Language Server](https://luals.github.io/) VSCode extension.
1. Install the Addon.
2. In your mod's `Loenn` directory, create a `.vscode/settings.json` file if it doesn't exist, with these contents:
    ```json
    {
        "Lua.workspace.library": [
            "${3rd}/love2d/library",
            "${addons}/loenn/library"
        ],
        "Lua.runtime.version": "LuaJIT",
        "Lua.runtime.special": {
            "love.filesystem.load": "loadfile"
        }
    }
    ```
    This will enable type annotations for both Lönn and Löve2d.

## Usage

### Entity plugins
When creating your EntityHandler table (the one you define `name` and all the other functions on), make sure to use the proper type annotation, for example:

```lua
---@type EntityHandler<Entity>
local directionalPuffer = {
    name = "FrostHelper/DirectionalPuffer",
}

return directionalPuffer
```

Now, you can type `directionalPuffer.` and see a list of auto-completions to implement various Lönn APIs, for example `directionalPuffer.flip = <press tab>`.

When accessing custom fields on your `entity` instances, you might get warnings about missing fields.
To fix this, you can create your own class extending from `Entity` with new fields available on your entities at the top of your file:

```lua
---@class DirectionalPuffer : Entity
---@field directory? string
---@field static? boolean
---@field explodeDirection? "Left"|"Right"|"Both"|"None"

---@type EntityHandler<DirectionalPuffer>
local directionalPuffer = {
    name = "FrostHelper/DirectionalPuffer"
}

function directionalPuffer.texture(room, entity) 
    -- No more warnings here!
    return entity.static and "textureA" or "textureB"
end
```

Alternatively, you can use `EntityHandler<UnknownEntity>` to suppress missing field warnings (all unknown fields will be marked as `any`).

### Trigger plugins

Same as Entity plugins, but use `Trigger` and `TriggerHandler<T>` classes instead.

### mods.requireFromPlugin
Because the extension doesn't know about how this method works, you won't get annotations from your mod's libraries by default. To fix this, you can use `@module`:
```lua
---@module "jautils"
local jautils = require("mods").requireFromPlugin("libraries.jautils")
```