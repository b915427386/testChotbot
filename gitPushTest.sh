#!/bin/bash
git add -A
time=`date "+%Y%m%d%H%M%S"` 
git commit -m "$time"
git push testChotbot master
