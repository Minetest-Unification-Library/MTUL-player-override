mtul = mtul or {}
mtul.player_override = {}
local old_mtable = {}
minetest.register_on_joinplayer(function(player)
    if not mtul.player_override.objref_mtable then
        mtul.player_override.objref_mtable = getmetatable(player)
        mtul.player_override.objref_mtable_old = {}
        --make the table immutable.
        setmetatable(mtul.player_override.objref_mtable_old, {__index=old_mtable, __newindex=function() error("attempt to override old player objref metatable") end})
        for i, v in pairs(mtul.player_override.objref_mtable) do
            old_mtable[i] = v
        end
    end
end)
local objref_mtable = mtul.player_override.objref_mtable
function mtul.player_override.override_method(method_name, func)
    assert(objref_mtable[method_name], "mtul.player_override: no player found method by the name "..method_name)
    assert(type(func)=="function", "must set metatable as a function")
    mtul.player_override.objref_mtable[method_name] = func
end