# Use difference between actual no. of trades and stored trade count to detect
# player closing the trade window. cartokill.kills is success count of kill.
scoreboard objectives add cartokill.trade minecraft.custom:minecraft.traded_with_villager
scoreboard objectives add cartokill.oldtr dummy
scoreboard objectives add cartokill.kills dummy

# Const objective may already be defined by coords datapack. Aint no thang.
scoreboard objectives add const dummy
scoreboard players set 0 const 0

