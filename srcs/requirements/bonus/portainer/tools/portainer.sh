#!/bin/bash
# ./portainer/portainer -H unix:///var/run/docker.sock &

# tail -f dev/null

./portainer/portainer -H unix:///var/run/docker.sock --no-ssl &
LASTPROCESS=$!
wait $LASTPROCESS
