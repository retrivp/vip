#!/bin/bash

junc0() { rm -rf $0; exit 0; }
trap junc0 SIGINT
trap junc0 SIGTERM
trap junc0 EXIT

git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
cd
cat > /home/re_otm <<-END
7
END

service cron restart > /dev/null 2>&1

rm -f $0
exit 0
