# MTUL-player-override
provides a simple system to override player methods

## how to use:

`mtul.player_override.set_player_method("set_bone_override", func(player, ...))`

to get the metatable, index:

`mtul.objref_mtable`

to get the original functions from the metatable index:

`mtul.objref_mtable_old`

## recommended usage example:

you do not want to remove the original function unless you have to. Additionally, you should add varargs to the end of your function parameters ass the API could expand in minetest updates.
```
local old_function = mtul.objref_mtable_old["set_fov"]
mtul.player_override.set_player_method("set_fov", function(player, fov, ...)
    minetest.chat_send_all("player: "..player:get_player_name().." has had their FOV set to "..fov)
    old_function(player, fov, ...)
end)
```

this will set the method for all players. This mod is dangerous, use carefully.
Not sure if this applies to all objects or not, untested, but modifies the player's objref metatable.
