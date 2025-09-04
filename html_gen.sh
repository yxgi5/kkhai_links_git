find -type f -name '*.jpg' > tmp.txt
find -type f -name '*.JPG' >> tmp.txt
find -type f -name '*.png' >> tmp.txt
find -name 'tmp.txt' | xargs perl -pi -e 's|(.*)$|<img src="$1" onload="if(this.width>'830')this.width='1250';" border="0" width="1250">|'
mv tmp.txt tmp.html