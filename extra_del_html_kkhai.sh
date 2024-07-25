#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")



function pause(){
    read -n 1
}


function rm_dummy_files(){
	#echo "in rm_dummy_files()"
    for dummy_files in `find . -type f -name "*.html" -o -name "*.url" -o -name "*.txt" -o -name "Thumbs.db*"`
    do
        echo rm -f ${dummy_files}
		printf '%s\0' ${dummy_files} | xargs -r0 rm -f
		#printf '%s\0' ${dummy_files} | xargs -r0 gio trash
		#pause
    done
}



#######################################################################################################
# handle single tar file
for folders in `find . -type f -name "*.tar"`
#FILES=*
#for folders in $FILES
do 
echo $folders
tar xvf $folders
if [ $? != 0 ]
then
    echo -e "\e[31mfailed!!!!!!!!!!!!!!!!!!!!\e[0m"
    exit 1
fi
if [ -e *.html ]
    then rm *.html
    echo rm *.html
fi
#rm -rf $folders
#gio trash $folders
echo -e "removing $folders"'\n'

echo rm -f ${folders}
printf '%s\0' ${folders} | xargs -r0 rm -f
#printf '%s\0' ${folders} | xargs -r0 gio trash

rm_dummy_files
echo -e '\n'"\e[32mEverything is OK! bye!!!!!!!!!!!!!!!!!!!!\e[0m"'\n''\n'
#read -n 1
done


#######################################################################################################

# for kkhai 7z.001 ... in subfolder, mov these files to to top level folder
for folders in `find . -maxdepth 1 -type d | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///'`
#FILES=*
#for folders in $FILES
do 
#echo mv \"$folders\"/* .
if [ -e "${folders}"/*.7z* ]
    then echo mv "${folders}"/*.7z* -t .
    mv "${folders}"/*.7z* -t .
fi
#mv \"$folders\"/* .
#tar -zcvpf $folders.tar.gz $folders/*
#7z a -sdel $folders.7z $folders/*
#7z a -sdel -t7z -mx9 -aoa $folders.7z $folders
#rm -rf $folders
done

for folders in `find . -type f -name "*.gz"`
#FILES=*
#for folders in $FILES
do 
echo $folders
#rar x -p'https://www.91xiezhen.top' $folders
7z x -p'https://www.91xiezhen.top' $folders
if [ $? != 0 ]
then
    echo -e "\e[31mfailed!!!!!!!!!!!!!!!!!!!!\e[0m"
    exit 1
fi
if [ -e *.html ]
    then rm *.html
    echo rm *.html
fi

#rm -rf $folders
#gio trash $folders
echo -e "removing $folders"'\n'

echo rm -f ${folders}
printf '%s\0' ${folders} | xargs -r0 rm -f
#printf '%s\0' ${folders} | xargs -r0 gio trash

rm_dummy_files
echo -e '\n'"\e[32mEverything is OK! bye!!!!!!!!!!!!!!!!!!!!\e[0m"'\n''\n'
#read -n 1
done

for folders in `find . -type f -name "*.7z"`
#FILES=*
#for folders in $FILES
do 
echo $folders
#rar x -p'https://www.91xiezhen.top' $folders
7z x -p'https://www.91xiezhen.top' $folders
if [ $? != 0 ]
then
    echo -e "\e[31mfailed!!!!!!!!!!!!!!!!!!!!\e[0m"
    exit 1
fi
if [ -e *.html ]
    then rm *.html
    echo rm *.html
fi
#rm -rf $folders
#gio trash $folders
echo -e "removing $folders"'\n'

echo rm -f ${folders}
printf '%s\0' ${folders} | xargs -r0 rm -f
#printf '%s\0' ${folders} | xargs -r0 gio trash

rm_dummy_files
echo -e '\n'"\e[32mEverything is OK! bye!!!!!!!!!!!!!!!!!!!!\e[0m"'\n''\n'
#read -n 1
done

for folders in `find . -type f -name "*.part1.rar"`
#FILES=*
#for folders in $FILES
do 
echo $folders
7z x -p'https://www.91xiezhen.top' $folders
if [ $? != 0 ]
then
    echo -e "\e[31mfailed!!!!!!!!!!!!!!!!!!!!\e[0m"
    exit 1
fi
if [ -e *.html ]
    then rm *.html
    echo rm *.html
fi
#rm -rf `echo $folders | sed s/.part1.rar$/.part*.rar/`
#rm -f `echo $folders | sed s/.part1.rar$/.part*.rar/`
#rm `echo $folders | sed s/.part1.rar$/.part*.rar/`
#gio trash `echo $folders | sed s/.part1.rar$/.part*.rar/`
echo -e "removing `echo ${folders} | sed s/.part1.rar$/.part*.rar/`"'\n'
regex=`echo "${folders}" | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed -e 's/.part.*$/.part/'`

    for i in `ls "${regex}"*.rar`
    do
        echo rm -f ${i}
        #printf '%s\0' ${i} | xargs -r0 rm -f
        printf '%s\0' ${i} | xargs -r0 gio trash
    done

rm_dummy_files
echo -e '\n'"\e[32mEverything is OK! bye!!!!!!!!!!!!!!!!!!!!\e[0m"'\n''\n'
#read -n 1
done

for folders in `find . -type f -name "*.rar"`
#FILES=*
#for folders in $FILES
do 
echo $folders
7z x -p'https://www.91xiezhen.top' $folders
if [ $? != 0 ]
then
    echo -e "\e[31mfailed!!!!!!!!!!!!!!!!!!!!\e[0m"
    exit 1
fi
if [ -e *.html ]
    then rm *.html
    echo rm *.html
fi
#rm -rf $folders
#gio trash $folders
echo -e "removing $folders"'\n'

echo rm -f ${folders}
printf '%s\0' ${folders} | xargs -r0 rm -f
#printf '%s\0' ${folders} | xargs -r0 gio trash

rm_dummy_files
echo -e '\n'"\e[32mEverything is OK! bye!!!!!!!!!!!!!!!!!!!!\e[0m"'\n''\n'
#read -n 1
done

for folders in `find . -type f -name "*.zip"`
#FILES=*
#for folders in $FILES
do 
echo $folders
unzip -O cp936 -P 'https://www.91xiezhen.top' $folders
if [ $? != 0 ]
then
    echo -e "\e[31mfailed!!!!!!!!!!!!!!!!!!!!\e[0m"
    exit 1
fi
#7z -scs936 l $folders
#7za -p'https://www.91xiezhen.top' -mcp=936 -y x $folders   # 7z -scs=/-mcp=, 这种回答就纯瞎扯了, 这是生成时候用的, 解压时候无效.
#convmv -f GBK -t utf8 --notest -r .
if [ -e *.html ]
    then rm *.html
    echo rm *.html
fi
#rm -rf `echo $folders | sed s/.zip$/.z*/`
#gio trash `echo $folders | sed s/.zip$/.z*/`
echo -e "removing $folders"'\n'

echo rm -f ${folders}
printf '%s\0' ${folders} | xargs -r0 rm -f
#printf '%s\0' ${folders} | xargs -r0 gio trash

rm_dummy_files
echo -e '\n'"\e[32mEverything is OK! bye!!!!!!!!!!!!!!!!!!!!\e[0m"'\n''\n'
#read -n 1
done


# handle 7z.* files
for folders in `find . -type f -name "*.7z.001"`
#FILES=*
#for folders in $FILES
do 
echo extracting $folders
#rar x -p'https://www.91xiezhen.top' $folders
7z x -p'https://www.91xiezhen.top' $folders
if [ $? != 0 ]
then
    echo -e "\e[31mfailed!!!!!!!!!!!!!!!!!!!!\e[0m"
    exit 1
fi
if [ -e *.html ]
    then rm *.html
    echo rm *.html
fi
#echo -e "rm -rf \"`echo ${folders} | sed s/.001$/.*/`\""
#echo -e "rm -rf `echo ${folders} | sed s/.001$/.*/`"
#rm -rf `echo \"${folders}\" | sed s/.001$/.*/`
#echo ${folders} | sed s/.001$/.*/ | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed -e 's/ /\\ /g'
#echo ${folders} | sed s/.001$/.*/ | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///'
#echo rm ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed -e 's/^\(.*\).7z.*/"\1".7z.*/'
#echo rm ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/.*/'
#rm ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/.*/' | grep ' ' -z -Z
#echo ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/.*/' | printf '%s\0' * | grep ' ' -z -Z | xargs -r0 rm -f
#echo ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/.*/' | xargs -r0 printf '%s\0' | grep ' ' -z -Z | xargs -r0 rm -f
#echo ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/.*/' | printf '%s\0' | grep ' ' -z -Z | xargs -r0 rm
#rm ${folders} | sed 's/.001$/.*/' | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | xargs -r0 printf '%s\0' | grep ' ' -z -Z
#echo rm `echo ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/.*/' | grep ' ' -z -Z `
#rm `echo ${folders} | sed 's/.001$/.*/' | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///'`
#echo ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/.*/' | printf '%s\0' {} \ | grep ' ' -z -Z | xargs -r0 rm -f
#find . -name `echo ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/.*/'` -type f -print -exec  rm -rf  {} \;  


#a=`echo "[aaaa]bbbb cc.dd.ee ff.gggg hhhhh[ii-jjjj].7z.001" | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$//'`
#echo ${a}
#ls "${a}"*
#printf '%s\0' `ls "${a}"*`| grep ' ' -z -Z | xargs -r0 rm -f

echo -e "removing `echo ${folders} | sed s/.001$/.*/`"'\n'
regex=`echo "${folders}" | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/./'`
#printf '%s\n' `ls "${regex}"*`

#gio trash `echo "${folders}" | sed s/.001$/.*/ `
#echo ${folders} | sed -e 's/^\.$//' | sed -e '/^$/d' | sed -e 's/.\///' | sed 's/.001$/.*/' | printf '%s\0' * | grep ' ' -z -Z | xargs -r0 gio trash
#printf '%s\0' `ls "${regex}"*` | grep ' ' -z -Z | xargs -r0 rm -f
#printf '%s\0' `ls "${regex}"*` | grep ' ' -z -Z | xargs -r0 gio trash


    for i in `ls "${regex}"*`
    do
        echo rm -f ${i}
        printf '%s\0' ${i} | xargs -r0 rm -f
        #printf '%s\0' ${i} | xargs -r0 gio trash
    done

rm_dummy_files
echo -e '\n'"\e[32mEverything is OK! bye!!!!!!!!!!!!!!!!!!!!\e[0m"'\n''\n'
#echo -e '\n'"\e[31mbye!!!!!!!!!!!!!!!!!!!!\e[0m"
#read -n 1
done

for folders in `find . -maxdepth 1 -type f -name "*.mp4"`
#FILES=*
#for folders in $FILES
do 
echo $folders
mkdir `echo $folders | sed 's/\.mp4$//'`
mv $folders `echo $folders | sed 's/\.mp4$//'`
#gio trash $folders
done

for folders in `find . -maxdepth 1 -type f -name "*.mov"`
#FILES=*
#for folders in $FILES
do 
echo $folders
mkdir `echo $folders | sed 's/\.mov$//'`
mv $folders `echo $folders | sed 's/\.mov$//'`
#gio trash $folders
done

for folders in `find . -maxdepth 1 -type f -name "*.mkv"`
#FILES=*
#for folders in $FILES
do 
echo $folders
mkdir `echo $folders | sed 's/\.mkv$//'`
mv $folders `echo $folders | sed 's/\.mkv$//'`
#gio trash $folders
done

for folders in `find . -type f -name "*.url"`
#FILES=*
#for folders in $FILES
do 
echo $folders
#rm -rf $folders
gio trash $folders
done

for folders in `find . -type f -name "Thumbs.db*"`
#FILES=*
#for folders in $FILES
do 
echo $folders
#rm -rf $folders
gio trash $folders
done


for folders in `find . -type f -name "*.html"`
#FILES=*
#for folders in $FILES
do 
echo $folders
#rm -rf $folders
gio trash $folders
done

sync
sync
sync

#统计文件数目
echo "We have" `find ./ -type d | wc -l` "folders and" `find ./ -type f | wc -l` "files in total."

# restore $IFS
IFS=$SAVEIFS





