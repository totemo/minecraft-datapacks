# Ticks since rest, days since rest and ticks since last warning, player Y and
# percentage chance of phantom spawns.
# Objective names are limited to 16 characters. :/
# Player Y coordinate used to suppress warning when player below Y 62, since
# phantoms won't spawn.
scoreboard objectives add fatigue.ticks minecraft.custom:minecraft.time_since_rest
scoreboard objectives add fatigue.days dummy
scoreboard objectives add fatigue.warned dummy
scoreboard objectives add fatigue.y dummy
scoreboard objectives add fatigue.chance dummy

# Const objective may already be defined by coords datapack. Aint no thang.
scoreboard objectives add const dummy
scoreboard players set 3 const 3
scoreboard players set 100 const 100
scoreboard players set 24000 const 24000

