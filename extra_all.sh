#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for folders in `ls -l |grep ^d |awk '{print substr($0,index($0,$9))}'`
#FILES=*
#for folders in $FILES
do 
echo cd $folders
cd $folders
cp ../extra_del_html_kkhai.sh .
./extra_del_html_kkhai.sh
cd ..
done

#rm packup_folder_name_with_space_del.sh
# restore $IFS
IFS=$SAVEIFS