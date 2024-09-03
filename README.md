# MTUL-player-override
provides a simple system to override player methods

how to use:

`mtul.player_override.set_player_method("set_bone_override", func(player, ...))`

to get the metatable, index:

`mtul.objref_mtable`

to get the original functions from the metatable index:

`mtul.objref_mtable_old`

this will set the method for all players. This mod is dangerous, use carefully.
Not sure if this applies to all objects or not, untested, but modifies the player's objref metatable.
