execute at @s as @s store success score @s cartokill.kills run kill @e[type=villager,nbt={Profession:1,Career:2},distance=..7]
execute if score @s cartokill.kills > 0 const run tellraw @s [{"color":"red","text":"To prevent a server crash, nearby cartographers have been killed. Sorry."}]

# Remember the new trade count.
execute as @s store result score @s cartokill.oldtr run scoreboard players get @s cartokill.trade

