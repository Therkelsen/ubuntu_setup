#!/bin/bash

sudo apt update
sudo apt install openjdk-11-jre
sudo apt install icedtea-netx

cd ~/var/tmp
curl -O https://login.exammonitor.dk/exam.jnlp

javaws exam.jnlp &
JAVAWS_PID=$!

wait $JAVAWS_PID

rm -f exam.jnlp
