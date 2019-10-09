# Initialise CoordsHidden to 0 when unset.
scoreboard players add @a CoordsHidden 0

# If not initialised, itc.Tick = 0.
scoreboard players add @a itc.Tick 0

# itc.Tick = (itcTick + 1) % 8
scoreboard players operation @a itc.Tick += 1 const
scoreboard players operation @a itc.Tick %= 8 const

# Update display when itc.Tick is 0.
execute as @a[scores={itc.Tick=0}] run function io.totemo.coords:coords-display


