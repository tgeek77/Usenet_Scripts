#!/bin/bash

NOW=`date '+%F_%H:%M:%S'`
ARTICLES=`find /var/spool/news/articles/ -type f -name '*' -printf x | wc -c`
ALT=`find /var/spool/news/articles/alt -type f -name '*' -printf x | wc -c`
COMP=`find /var/spool/news/articles/comp -type f -name '*' -printf x | wc -c`
NEWS=`find /var/spool/news/articles/news -type f -name '*' -printf x | wc -c`
MISC=`find /var/spool/news/articles/misc -type f -name '*' -printf x | wc -c`
SCI=`find /var/spool/news/articles/sci -type f -name '*' -printf x | wc -c`
HUM=`find /var/spool/news/articles/humanities -type f -name '*' -printf x | wc -c`
REC=`find /var/spool/news/articles/rec -type f -name '*' -printf x | wc -c`
SOC=`find /var/spool/news/articles/soc -type f -name '*' -printf x | wc -c`
TALK=`find /var/spool/news/articles/talk -type f -name '*' -printf x | wc -c`
FREE=`find /var/spool/news/articles/free -type f -name '*' -printf x | wc -c`
SIZE=`du -s /var/spool/news/articles | awk '{print $1}'`
SIZEMB=`expr $SIZE / 1024`

echo $NOW > /var/www/html/reports/$NOW.sizereport.txt
printf "Total number of articles:," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$ARTICLES" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "Current size in MB," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$SIZEMB" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "alt.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$ALT" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "free.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$FREE" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "comp.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$COMP" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "humanities.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$HUM" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "misc.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$MISC" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "news.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$NEWS" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "rec.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$REC" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "sci.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$SCI" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "soc.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$SOC" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt
printf "talk.," >> /var/www/html/reports/$NOW.sizereport.txt;printf "$TALK" >> /var/www/html/reports/$NOW.sizereport.txt
echo >> /var/www/html/reports/$NOW.sizereport.txt

cp -v /var/www/html/reports/$NOW.sizereport.txt /var/www/html/reports/sizereport.txt
mv -v /var/www/html/reports/$NOW.sizereport.txt /var/www/html/reports/archive/$NOW.sizereport.txt 
