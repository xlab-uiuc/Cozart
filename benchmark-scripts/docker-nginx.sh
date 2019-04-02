#!/bin/bash
itr=1
reqcnt=5000

source benchmark-scripts/general-helper.sh
source benchmark-scripts/docker-helper.sh
mark_start
mount_fs
randomd
enable_network
rm -rf /run/docker* /var/run/docker*
dockerd &
sleep 5;
docker system prune --all --force;
docker run -dit --name my-nginx-app -p 80:80 nginx:1.14
for i in `seq $itr`; do
    ab -n $reqcnt -c 100 127.0.0.1:80/index.html;
done
docker stop my-nginx-app
write_modules
mark_end
