#!/bin/bash

# send an alert if /data/fs1 loses its mount so that it can be remounted
function is_data_mounted {
if ! df -h | grep /data/fs1 ; then logger "/data/fs1 is not mounted on $(hostname)" ; fi
}

is_data_mounted
