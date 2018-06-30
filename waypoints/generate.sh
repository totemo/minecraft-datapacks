#!/bin/bash

#------------------------------------------------------------------------------
# Function to generate functions for each waypoint.
# $1 = waypoint name.

genwp()
{(
    NAME="$1"
    LOWER=$(echo "${NAME}" | tr [:upper:] [:lower:])
    if [ "$LOWER" == "$NAME" ]; then
        ID="${LOWER}"
    else
        # Capital letter name. Function names must be all lower case and
        # objective IDs are case insensitive, so for IDs use a_ for A.
        ID="${LOWER}_"
    fi
    echo -n "$NAME ($ID) "

    cat > "wp${ID}-load.mcfunction" <<EOF
scoreboard objectives add WP${ID}X dummy
scoreboard objectives add WP${ID}Y dummy
scoreboard objectives add WP${ID}Z dummy
scoreboard objectives add WP${ID}Dim dummy
EOF

    cat > "wp${ID}-command.mcfunction" <<EOF
tellraw @s [{"text":"WayPoint ","color":"gold"},{"text":"${NAME}","color":"yellow"},{"text":" is at X ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}X"},"color":"white"},{"text":" Y ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}Y"},"color":"white"},{"text":" Z ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}Z"},"color":"white"},{"text":" Dim ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}Dim"},"color":"white"},{"text":".","color":"gold"}]
EOF

    cat > "setwp${ID}-command.mcfunction" <<EOF
execute as @s store result score @s WP${ID}X run data get entity @s Pos[0] 1.0
execute as @s store result score @s WP${ID}Y run data get entity @s Pos[1] 1.0
execute as @s store result score @s WP${ID}Z run data get entity @s Pos[2] 1.0
execute as @s store result score @s WP${ID}Dim run data get entity @s Dimension 1.0

function io.totemo.waypoints:wp${ID}-command
tellraw @s [{"text":"Run ","color":"gold"},{"text":"!wp${NAME}","color":"yellow"},{"text":" to see this again.","color":"gold"}]
EOF

    cat > "delwp${ID}-command.mcfunction" <<EOF
execute as @s[scores={WP${ID}Y=0}] run tellraw @s [{"text":"Waypoint ","color":"gold"},{"text":"${NAME}","color":"yellow"},{"text":" has not yet been set."}]

execute as @s[scores={WP${ID}Y=1..}] run tellraw @s [{"text":"Deleted waypoint: ","color":"gold"},{"text":"${NAME}","color":"yellow"},{"text":" (X ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}X"},"color":"white"},{"text":" Y ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}Y"},"color":"white"},{"text":" Z ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}Z"},"color":"white"},{"text":" Dim ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}Dim"},"color":"white"},{"text":")","color":"gold"}]

scoreboard players set @s WP${ID}Y 0
EOF
    
    cat >> "listwps-tick.mcfunction" <<EOF
scoreboard players add @a WP${ID}Y 0
EOF

    # List function only calls subservient function if Y>0.
    cat >> "listwps-command.mcfunction" <<EOF
execute as @s[scores={WP${ID}Y=1..}] run tellraw @s [{"text":"${NAME}","color":"yellow"},{"text":"   X ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}X"},"color":"white"},{"text":" Y ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}Y"},"color":"white"},{"text":" Z ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}Z"},"color":"white"},{"text":" Dim ","color":"gold"},{"score":{"name":"*","objective":"WP${ID}Dim"},"color":"white"}]
execute as @s[scores={WP${ID}Y=1..}] run scoreboard players add @a WPCount 1
EOF
)}

#------------------------------------------------------------------------------
# Set up to generate code.

HERE=$(cd $(dirname "$0") && pwd)
PACKAGE=$(basename "$HERE")
FUNCTIONS="$HERE/src/data/io.totemo.$PACKAGE/functions"
cd "$FUNCTIONS"

#------------------------------------------------------------------------------
# !listwps tick prologue.

cat > "listwps-tick.mcfunction" <<EOF
# Init Y=0 (WP unused), for all players, every tick to handle new logins.
EOF

#------------------------------------------------------------------------------
# !listwps command prologue: set up to count waypoints.

cat > "listwps-command.mcfunction" <<EOF
scoreboard players set @s WPCount 0
EOF

#------------------------------------------------------------------------------

for NAME in {0..9} {a..z} {A..Z}; do 
    genwp "$NAME"
done

#------------------------------------------------------------------------------
# !listwps command epilogue: show count of waypoints.

cat >> "listwps-command.mcfunction" <<EOF
execute as @s run tellraw @s [{"text":"Total waypoints: ","color":"gold"},{"score":{"name":"*","objective":"WPCount"},"color":"white"}]
EOF

#------------------------------------------------------------------------------

echo
echo "Generated functions in $FUNCTIONS"

