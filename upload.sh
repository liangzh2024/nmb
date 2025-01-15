host=i68.japaneast.cloudapp.azure.com
hugo --cleanDestinationDir --gc --minify
rm -rf nmb.tar.gz
cd ./public
tar -zcvf ../nmb.tar.gz  *
cd ../
ssh ljl@$host rm -rf /home/ljl/bak/webtar/nmb.tar.gz
scp nmb.tar.gz ljl@$host:/home/ljl/bak/webtar/
ssh ljl@$host rm -rf /home/ljl/www/nmb/*
ssh ljl@$host tar -zxvf /home/ljl/bak/webtar/nmb.tar.gz -C /home/ljl/www/nmb/

curl -X POST https://api.indexnow.org/IndexNow \
  -H "Host: api.indexnow.org" \
  -H "Content-Type: application/json; charset=utf-8" \
  -d @./public/index.json
