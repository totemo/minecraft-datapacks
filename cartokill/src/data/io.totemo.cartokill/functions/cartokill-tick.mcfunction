# Initialise to 0.
scoreboard players add @a cartokill.oldtr 0
execute as @a if score @s cartokill.trade > @s cartokill.oldtr run function io.totemo.cartokill:cartokill-trade
