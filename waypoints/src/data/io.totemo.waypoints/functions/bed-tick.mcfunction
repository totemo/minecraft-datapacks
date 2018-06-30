# Copy SleepTimer NBT tag (0..1) to SleepTimer objective.
execute as @a store result score @s SleepTimer run data get entity @s SleepTimer 1.0

# On entering a bed, store BedX, BedY, BedZ, BedDim.
execute as @a[scores={SleepTimer=1}] store result score @s BedX run data get entity @s Pos[0] 1.0
execute as @a[scores={SleepTimer=1}] store result score @s BedY run data get entity @s Pos[1] 1.0
execute as @a[scores={SleepTimer=1}] store result score @s BedZ run data get entity @s Pos[2] 1.0
execute as @a[scores={SleepTimer=1}] store result score @s BedDim run data get entity @s Dimension 1.0

# PM the player his bed coords.
execute as @a[scores={SleepTimer=1}] run function io.totemo.waypoints:bed-command
