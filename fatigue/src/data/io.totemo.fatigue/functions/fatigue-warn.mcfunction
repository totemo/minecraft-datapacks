execute store result score @s fatigue.days run scoreboard players get @s fatigue.ticks
scoreboard players operation @s fatigue.days /= 24000 const

# Percentage chance is 100 * (days - 3) / days.
execute store result score @s fatigue.chance run scoreboard players get @s fatigue.days
scoreboard players operation @s fatigue.chance -= 3 const
scoreboard players operation @s fatigue.chance *= 100 const
scoreboard players operation @s fatigue.chance /= @s fatigue.days

tellraw @s [{"color":"gold","text":"You haven't slept in "},{"score":{"name":"*","objective":"fatigue.days"},"color":"yellow"},{"color":"gold","text":" days."}]
tellraw @s [{"color":"gold","text":"There's a "},{"score":{"name":"*","objective":"fatigue.chance"},"color":"yellow"},{"color":"gold","text":"% chance of phantoms attacking."}]
scoreboard players set @s fatigue.warned 0
