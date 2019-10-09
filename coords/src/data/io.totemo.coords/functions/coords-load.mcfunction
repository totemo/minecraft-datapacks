# TODO: I should prefix all my objectives to avoid name clashes.
scoreboard objectives add X dummy
scoreboard objectives add Y dummy
scoreboard objectives add Z dummy

scoreboard objectives add Bearing dummy
scoreboard objectives add Octant dummy

# CoordsHidden = 1 for hidden, 0 for visible.
scoreboard objectives add CoordsHidden dummy

# Per-player count used to avoid updating titles every tick.
scoreboard objectives add itc.Tick dummy

# Represent constants as <name> <objective> <value>, with the objective "const".
# Scoreboard values are always integers.
scoreboard objectives add const dummy
scoreboard players set 0 const 0
scoreboard players set 1 const 1
scoreboard players set 2 const 2
scoreboard players set 4 const 4
scoreboard players set 8 const 8
scoreboard players set 45 const 45
scoreboard players set 90 const 90
scoreboard players set 180 const 180
scoreboard players set 360 const 360
scoreboard players set 540 const 540

