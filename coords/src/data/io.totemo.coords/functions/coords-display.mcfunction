# Get player X, Y, Z and Yaw angle. Store as X, Y, Z, Bearing objectives.
execute as @a store result score @s X run data get entity @s Pos[0] 1.0
execute as @a store result score @s Y run data get entity @s Pos[1] 1.0
execute as @a store result score @s Z run data get entity @s Pos[2] 1.0
execute as @a store result score @s Bearing run data get entity @s Rotation[0]

# Adjust bearing to compass convention.
scoreboard players operation @a Bearing += 540 const
scoreboard players operation @a Bearing %= 360 const

# Set Octant to 0..7: 
# First set Octant = Bearing, longhand.
execute as @a store result score @s Octant run scoreboard players get @s Bearing
scoreboard players operation @a Octant *= 2 const
scoreboard players operation @a Octant += 45 const
scoreboard players operation @a Octant /= 90 const
scoreboard players operation @a Octant %= 8 const

# Debugging Bearing and Octant:
#title @a title {"text":""}
#title @a subtitle [{"text":"X ","color":"gray"},{"score":{"name":"*","objective":"X"},"color":"white"},{"text":" Y ","color":"gray"},{"score":{"name":"*","objective":"Y"},"color":"white"},{"text":" Z ","color":"gray"},{"score":{"name":"*","objective":"Z"},"color":"white"},{"text":" B ","color":"gray"},{"score":{"name":"*","objective":"Bearing"},"color":"white"},{"text":" O ","color":"gray"},{"score":{"name":"*","objective":"Octant"},"color":"white"}]

# N: Octant = 0
title @a[scores={Octant=0,CoordsHidden=0}] actionbar [{"text":"N  ","color":"white"},{"text":"X ","color":"gray"},{"score":{"name":"*","objective":"X"},"color":"white"},{"text":" Y ","color":"gray"},{"score":{"name":"*","objective":"Y"},"color":"white"},{"text":" Z ","color":"gray"},{"score":{"name":"*","objective":"Z"},"color":"white"}]

# NE: Octant = 1
title @a[scores={Octant=1,CoordsHidden=0}] actionbar [{"text":"NE ","color":"white"},{"text":"X ","color":"gray"},{"score":{"name":"*","objective":"X"},"color":"white"},{"text":" Y ","color":"gray"},{"score":{"name":"*","objective":"Y"},"color":"white"},{"text":" Z ","color":"gray"},{"score":{"name":"*","objective":"Z"},"color":"white"}]

# E: Octant = 2
title @a[scores={Octant=2,CoordsHidden=0}] actionbar [{"text":"E  ","color":"white"},{"text":"X ","color":"gray"},{"score":{"name":"*","objective":"X"},"color":"white"},{"text":" Y ","color":"gray"},{"score":{"name":"*","objective":"Y"},"color":"white"},{"text":" Z ","color":"gray"},{"score":{"name":"*","objective":"Z"},"color":"white"}]

# SE: Octant = 3
title @a[scores={Octant=3,CoordsHidden=0}] actionbar [{"text":"SE ","color":"white"},{"text":"X ","color":"gray"},{"score":{"name":"*","objective":"X"},"color":"white"},{"text":" Y ","color":"gray"},{"score":{"name":"*","objective":"Y"},"color":"white"},{"text":" Z ","color":"gray"},{"score":{"name":"*","objective":"Z"},"color":"white"}]

# S: Octant = 4
title @a[scores={Octant=4,CoordsHidden=0}] actionbar [{"text":"S  ","color":"white"},{"text":"X ","color":"gray"},{"score":{"name":"*","objective":"X"},"color":"white"},{"text":" Y ","color":"gray"},{"score":{"name":"*","objective":"Y"},"color":"white"},{"text":" Z ","color":"gray"},{"score":{"name":"*","objective":"Z"},"color":"white"}]

# SW: Octant = 5
title @a[scores={Octant=5,CoordsHidden=0}] actionbar [{"text":"SW ","color":"white"},{"text":"X ","color":"gray"},{"score":{"name":"*","objective":"X"},"color":"white"},{"text":" Y ","color":"gray"},{"score":{"name":"*","objective":"Y"},"color":"white"},{"text":" Z ","color":"gray"},{"score":{"name":"*","objective":"Z"},"color":"white"}]

# W: Octant = 6
title @a[scores={Octant=6,CoordsHidden=0}] actionbar [{"text":"W  ","color":"white"},{"text":"X ","color":"gray"},{"score":{"name":"*","objective":"X"},"color":"white"},{"text":" Y ","color":"gray"},{"score":{"name":"*","objective":"Y"},"color":"white"},{"text":" Z ","color":"gray"},{"score":{"name":"*","objective":"Z"},"color":"white"}]

# NW: Octant = 7
title @a[scores={Octant=7,CoordsHidden=0}] actionbar [{"text":"NW ","color":"white"},{"text":"X ","color":"gray"},{"score":{"name":"*","objective":"X"},"color":"white"},{"text":" Y ","color":"gray"},{"score":{"name":"*","objective":"Y"},"color":"white"},{"text":" Z ","color":"gray"},{"score":{"name":"*","objective":"Z"},"color":"white"}]

