#!/bin/sh

# Thanks: http://stackoverflow.com/questions/14710257/running-a-cron-job-at-230-am-every-day
# On how to automate process at 2:30 every day (type "date" to get your server time)
# crontab -e
# 30 2 * * * /your/command

echo "Update rd-ambassador..."
cd $HOME/rd-ambassador
git pull
echo "Gitbook rd-ambassador..."
rm -r _book/
/usr/local/bin/node /usr/local/bin/gitbook build
/usr/local/bin/node /usr/local/bin/gitbook pdf . _book/rd-ambassador.pdf
/usr/local/bin/node /usr/local/bin/gitbook mobi . _book/rd-ambassador.mobi
/usr/local/bin/node /usr/local/bin/gitbook epub . _book/rd-ambassador.epub
cd ..
