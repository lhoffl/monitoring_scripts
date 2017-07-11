#!/bin/bash

function test_sssd {
  count=${SSSD_COUNT:=0} # set the count to the value of SSSD_COUNT, set the count to 0 if SSSD_COUNT is undefined
  
  if ($(systemctl status sssd | grep "running")) ; then # sssd is running, do nothing
    echo 'Doing nothing' 
  else # the user is not found, increase count
    (( count += 1))
  fi

  if [ "$count" == 3 ]; then # reached the threshold, restart SSSD
    count=0 #reset count
    echo 'Restarting SSSD'
    `systemctl restart sssd`
  fi

  export SSSD_COUNT=$count #set the count 
}

test_sssd 
