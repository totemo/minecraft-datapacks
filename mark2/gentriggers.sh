rm -f triggers.new
for NAME in {0..9} {a..z} {A..Z}; do 
    LOWER=$(echo "${NAME}" | tr [:upper:] [:lower:])
    if [ "$LOWER" == "$NAME" ]; then
        ID="${LOWER}"
    else
        # Capital letter name. Function names must be all lower case and
        # objective IDs are case insensitive, so for IDs use a_ for A.
        ID="${LOWER}_"
    fi
    echo -n "$NAME ($ID) "

    cat >> "triggers.new" <<EOF
!delwp${NAME},function waypoints:delwp${ID}-command
!setwp${NAME},function waypoints:setwp${ID}-command
!wp${NAME},function waypoints:wp${ID}-command

EOF

done

echo
echo
echo "Wrote ./triggers.new. Append to triggers.txt and ~reload mark2."

