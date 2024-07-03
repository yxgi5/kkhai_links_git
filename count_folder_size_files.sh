#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for folders in `find . -maxdepth 1 -type d | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///'`
do 
echo -ne `basename ${folders}`
echo -ne ' ['`find ${folders} -type f | wc -l | sed 's/$/P/'`
echo -ne '-'`du -sh ${folders} | cut -f1`']'
echo
done

IFS=$SAVEIFS


# usage:
# ./count_folder_size_files.sh | tee newnames.txt
