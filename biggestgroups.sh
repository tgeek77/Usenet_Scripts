#!/bin/bash

NOW=`date '+%F_%H:%M:%S'`

echo $NOW > /var/www/html/reports/mostarticles_big8.txt
find /var/spool/news/articles -xdev -type d -exec sh -c '
    echo "$(find "$0" | grep "^$0/[^/]*$" | wc -l) $0"' {} \; | sort -rn | grep -E ''/var/spool/news/articles/comp'|'/var/spool/news/articles/news'|'/var/spool/news/articles/misc'|'/var/spool/news/articles/sci'|'/var/spool/news/articles/humanities'|'/var/spool/news/articles/rec'|'/var/spool/news/articles/soc'|'/var/spool/news/articles/talk'' >> /var/www/html/reports/mostarticles_big8.txt

echo $NOW > /var/www/html/reports/top50_mostarticles.txt
find /var/spool/news/articles -xdev -type d -exec sh -c '
  echo "$(find "$0" | grep "^$0/[^/]*$" | wc -l) $0"' {} \; | sort -rn | head -50 >> /var/www/html/reports/top50_mostarticles.txt
