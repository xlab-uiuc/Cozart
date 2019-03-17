#!/bin/bash
itr=20
reqcnt=100000

source benchmark-scripts/general-helper.sh
mark_start;
mount_procfs;
enable_network;
sleep 3;
redis-server --save "" --appendonly no &
sleep 2;
redis-cli FLUSHALL
for i in `seq $itr`; do
    redis-benchmark -n $reqcnt -t SET,GET --csv
done
redis-cli shutdown
write_modules
mark_end;
