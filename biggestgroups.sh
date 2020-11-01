#!/bin/bash

NOW=`date '+%F_%H:%M:%S'`

echo "running big8 report"
echo
echo $NOW > /var/www/html/reports/$NOW.mostarticles_big8.txt
find /var/spool/news/articles -xdev -type d -exec sh -c '
    echo "$(find "$0" | grep "^$0/[^/]*$" | wc -l) $0"' {} \; | sort -rn | grep -E ''/var/spool/news/articles/comp'|'/var/spool/news/articles/news'|'/var/spool/news/articles/misc'|'/var/spool/news/articles/sci'|'/var/spool/news/articles/humanities'|'/var/spool/news/articles/rec'|'/var/spool/news/articles/soc'|'/var/spool/news/articles/talk'' >> /var/www/html/reports/$NOW.mostarticles_big8.txt
cp -v /var/www/html/reports/$NOW.mostarticles_big8.txt /var/www/html/reports/mostarticles_big8.txt
mv -v /var/www/html/reports/$NOW.mostarticles_big8.txt /var/www/html/reports/archive/$NOW.mostarticles_big8.txt

echo "running top50 report"
echo
echo $NOW > /var/www/html/reports/$NOW.top50_mostarticles.txt
find /var/spool/news/articles -xdev -type d -exec sh -c '
  echo "$(find "$0" | grep "^$0/[^/]*$" | wc -l) $0"' {} \; | sort -rn | head -50 >> /var/www/html/reports/$NOW.top50_mostarticles.txt
cp -v /var/www/html/reports/$NOW.top50_mostarticles.txt /var/www/html/reports/top50_mostarticles.txt
mv -v /var/www/html/reports/$NOW.top50_mostarticles.txt /var/www/html/reports/archive/$NOW.top50_mostarticles.txt

echo "running top1000 report"
echo
echo $NOW > /var/www/html/reports/$NOW.top1000_mostarticles.txt
find /var/spool/news/articles -xdev -type d -exec sh -c '
  echo "$(find "$0" | grep "^$0/[^/]*$" | wc -l) $0"' {} \; | sort -rn | head -1000 >> /var/www/html/reports/$NOW.top1000_mostarticles.txt
cp -v /var/www/html/reports/$NOW.top1000_mostarticles.txt /var/www/html/reports/top1000_mostarticles.txt
mv -v /var/www/html/reports/$NOW.top1000_mostarticles.txt /var/www/html/reports/archive/$NOW.top1000_mostarticles.txt

echo "articles with expire headers"
echo
echo $NOW > /var/www/html/reports/$NOW.expire_articles.txt
grep -r Expires: /var/spool/news/articles/ >> /var/www/html/reports/$NOW.expire_articles.txt
cp -v /var/www/html/reports/$NOW.expire_articles.txt /var/www/html/reports/expire_articles.txt
mv -v /var/www/html/reports/$NOW.expire_articles.txt /var/www/html/reports/archive/$NOW.expire_articles.txt

echo "ignored articles"
echo
cp -v /var/log/news/unwanted.log /var/www/html/reports/unwanted.txt
mv -v /var/www/html/reports/unwanted.txt /var/www/html/reports/archive/$NOW.unwanted.txt 
