# 一些图站网盘整理的数据库


# sql tips
```
$ sqlite3 kkhai.db 
sqlite> .mode csv
sqlite> .header off
sqlite> .separator |
sqlite> .out list1.csv
sqlite> select * from kkhai where catalog = '名站机构' order by id desc;
sqlite> .exit
```

或者`order by id desc`


#二进制文件分割成不同大小的两份
I have a file of 2024 bytes, I want to split this file in two parts: 300 bytes and 1724 bytes.


## 分出第一个文件大于等于第二个
有一个2024 bytes的文件，分割到两个文件 1724 bytes 和 300 bytes
split命令即可
```
split -b1724 testfile
```
也可以用dd等命令实现，见后文

## 分出第一个文件小于第二个
有一个2024 bytes的文件，分割到两个文件 和 300 bytes 和 1724 bytes


### 用head+tail命令实现

```
head -c2024 /dev/urandom > test.tt     ==           dd if=/dev/urandom of=test1.tt bs=1 count=2024
head -c300 test.tt > test.tt.001
tail -c+301 test.tt > test.tt.002
cat test.tt.* > output
md5sum test.tt output
```

参考
```
dd if=/dev/urandom of=bigfile bs=1M count=1024
```

### 用dd命令实现
```
dd if=/dev/urandom of=test1.tt bs=1 count=2046
dd if=test1.tt bs=1 count=300 of=test1.tt.001
dd if=test1.tt bs=1 skip=300 of=test1.tt.002
cat test1.tt.* > test1.out
md5sum test1.tt test1.out
```

参考
````
If your first command, as stated, is:
sudo dd if=/dev/sdf1 bs=4096 count=150GB | gzip > img1.gz
Then your second would be:
sudo dd if=/dev/sdf1 bs=4096 skip=150GB count=40GB | gzip > img2.gz
and third:
sudo dd if=/dev/sdf1 bs=4096 skip=190GB count=120GB | gzip > img3.gz



dd if=/dev/sdf1 bs=`expr 10 * 1024 * 1024` count=`expr 15 * 1024 * 1024 * 1024`


# Sets pipefail so failed dd makes the whole pipe command fail
set -o pipefail
dd_result=0
split=0
filenameSplit=
while [ $dd_result == 0 ]
do
    cmd="dd if=/dev/sdX bs=2G count=1 skip=$split | pigz --fast > \"2G.$filenameSplit.myharddisk.gz\""
    echo $cmd
    eval $cmd
    dd_result=$?
    split=$((split + 1))
    filenameSplit=$split
done



```



# window 类似效果操作

```
copy /b "source.file" +2048 "header.tmp"
copy /b "header.tmp" +1024 "output.file"
del "header.tmp"
```
这里的/b参数表示处理的是二进制文件，+2048和+1024分别表示从文件开头和header.tmp文件开头分别跳过多少字节。

解释：

第一条命令从source.file文件的2048字节位置开始，将剩余的全部内容复制到header.tmp文件。

第二条命令从header.tmp文件的开始，将1024字节的内容复制到output.file。

最后一条命令删除临时创建的header.tmp文件。

注意：这里的单位是字节，你需要根据实际情况调整数值。


```
copy /b C:\source\myfile.txt +,, 1000 C:\destination\myfile.txt
```
这个命令的含义是：

copy是用来复制文件的命令。

/b表示处理的是二进制文件。

C:\source\myfile.txt +,,是源文件的路径，后面的+,,是一个占位符，表示要从文件的当前位置开始读取。

1000是起始位置的偏移量，这里是从第1000个字节开始。

C:\destination\myfile.txt是目标文件的路径。

请注意，这个命令不会删除源文件中的任何数据，它只是将指定范围的数据复制到目标文件。如果目标文件已经存在，它将被覆盖。如果你想要追加到目标文件，可以使用+标志。

