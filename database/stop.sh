#!/bin/bash -e

if [ -f db.cid ]; then
  cid=$(<db.cid)
  echo "Stopping db" >> db.log
  docker rm -f ${cid} 2>&1 > /dev/null
  rm db.cid
fi
