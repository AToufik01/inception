#!/bin/bash
./portainer/portainer -H unix:///var/run/docker.sock  &
LASTPROCESS=$!
wait $LASTPROCESS
