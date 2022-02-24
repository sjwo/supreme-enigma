#!/usr/bin/bash

TIMESTAMP=$(date +'%Y-%m-%d-%H%M-%S')
OUTFILE=supreme-enigma-$TIMESTAMP.txt
MESSAGE=$*

echo "Collecting network data at $TIMESTAMP"
echo "Message for this collection: \"$MESSAGE\""
echo "Saving data to: $OUTFILE"

declare -a COMMANDS=("cat /etc/resolv.conf" "resolvectl status")

for command in "${COMMANDS[@]}"
do
    {
        printf "\n********** BEGIN %s **********\n" "$command" ;
        $command ;
        printf "********** END %s **********\n\n" "$command";
    } >> "$OUTFILE"
done