#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")


# $ echo 'abcd sss' | awk '{print $1}'
# abcd

# $ echo 'abcd sss' | awk '{print $2}'
# sss

# $ echo 'abcd sss' | awk '{print index($0,$2)}'
# 6

#for folders in `ls -l |grep ^d |awk '{print substr($0,index($0,$9))}'`
for folders in `find . -maxdepth 1 -type d | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///'`
#FILES=*
#for folders in $FILES
do 
#echo mv \"$folders\"/* .
echo mv "${folders}"/* -t .
mv "${folders}"/* -t .
#mv \"$folders\"/* .
#tar -zcvpf $folders.tar.gz $folders/*
#7z a -sdel $folders.7z $folders/*
#7z a -sdel -t7z -mx9 -aoa $folders.7z $folders
#rm -rf $folders
done

#统计文件数目
find ./ -type f | wc -l 
#find ./ -maxdepth 1 -type f| wc -l
#ls -l | grep "^-" | wc -l                  #统计当前目录下文件的数目
#ls -lR | grep "^-" | wc -l               #统计当前目录下文件的数目，包括子目录里的
#ls -l | grep "^d" | wc -l                #统计当前目录下文件夹（也就是目录）的数目
#ls -lR | grep "^d" | wc -l              #统计当前目录下文件夹（也就是目录）的数目，包括子目录里的
#注意是英文字母l，不是数字1


# restore $IFS
IFS=$SAVEIFS


# 
# gen.sh for test 
# ```
# #!/bin/bash
# 
# mkdir -p 1 2
# touch 1/f1
# touch 1/f2
# touch 2/f3
# touch 2/f4
# ```

