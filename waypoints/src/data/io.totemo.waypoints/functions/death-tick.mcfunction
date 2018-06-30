# Update DeathTime objective from player NBT data.
execute as @a store result score @s DeathTime run data get entity @s DeathTime 1.0

# On death, store DeathX, DeathY, DeathZ:
execute as @a[scores={DeathTime=1}] store result score @s DeathX run data get entity @s Pos[0] 1.0
execute as @a[scores={DeathTime=1}] store result score @s DeathY run data get entity @s Pos[1] 1.0
execute as @a[scores={DeathTime=1}] store result score @s DeathZ run data get entity @s Pos[2] 1.0
execute as @a[scores={DeathTime=1}] store result score @s DeathDim run data get entity @s Dimension 1.0

# PM the player his death coords.
execute as @a[scores={DeathTime=1}] run function io.totemo.waypoints:death-command
