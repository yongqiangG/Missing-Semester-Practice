#!/usr/bin/env bash

count=0
for((;;))
do
  sh $HOME/workspace/cs-course/Missing-Semester-Practice/random-wrong.sh &>$HOME/debug.log
  if [[ $? -ne 0 ]]; then
    echo "oops,it is wrong now,failed after $count times"
    echo "$(cat $HOME/debug.log)"
    break
  fi
  ((count++))
done
