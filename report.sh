#!/bin/bash

NOW=`date '+%F_%H:%M:%S'`
echo "Total number of articles:" > /home/jsevans/reports/$NOW-report.txt; find /var/spool/news/articles/ -type f -name '*' -printf x | wc -c >> /home/jsevans/reports/$NOW-report.txt
echo
echo "Total number of articles: alt.*" >> /home/jsevans/reports/$NOW-report.txt; find /var/spool/news/articles/alt -type f -name '*' -printf x | wc -c >> /home/jsevans/reports/$NOW-report.txt
echo
echo "Total number of articles: comp.*" >> /home/jsevans/reports/$NOW-report.txt; find /var/spool/news/articles/comp -type f -name '*' -printf x | wc -c >> /home/jsevans/reports/$NOW-report.txt
echo
echo "Total number of articles: news.*" >> /home/jsevans/reports/$NOW-report.txt; find /var/spool/news/articles/news -type f -name '*' -printf x | wc -c >> /home/jsevans/reports/$NOW-report.txt
echo
echo "Total number of articles: misc.*" >> /home/jsevans/reports/$NOW-report.txt; find /var/spool/news/articles/misc -type f -name '*' -printf x | wc -c >> /home/jsevans/reports/$NOW-report.txt
echo
echo "Total number of articles: sci.*" >> /home/jsevans/reports/$NOW-report.txt; find /var/spool/news/articles/sci -type f -name '*' -printf x | wc -c >> /home/jsevans/reports/$NOW-report.txt
echo
echo "Total number of articles: humanities.*" >> /home/jsevans/reports/$NOW-report.txt; find /var/spool/news/articles/humanities -type f -name '*' -printf x | wc -c >> /home/jsevans/reports/$NOW-report.txt
echo
echo "Total number of articles: rec.*" >> /home/jsevans/reports/$NOW-report.txt; find /var/spool/news/articles/rec -type f -name '*' -printf x | wc -c >> /home/jsevans/reports/$NOW-report.txt
echo
echo "Total number of articles: soc.*" >> /home/jsevans/reports/$NOW-report.txt; find /var/spool/news/articles/soc -type f -name '*' -printf x | wc -c >> /home/jsevans/reports/$NOW-report.txt
echo
echo
echo "Total size of archive:" >> /home/jsevans/reports/$NOW-report.txt; du -sh /var/spool/news/articles >> /home/jsevans/reports/$NOW-report.txt


