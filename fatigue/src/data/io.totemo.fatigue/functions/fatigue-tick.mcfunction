scoreboard players add @a fatigue.warned 1
execute as @a store result score @s fatigue.y run data get entity @s Pos[1] 1.0
execute as @a[scores={fatigue.ticks=96000..,fatigue.warned=24000..,fatigue.y=62..}] run function io.totemo.fatigue:fatigue-warn
