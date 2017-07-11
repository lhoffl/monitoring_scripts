#!/bin/bash

function reboot_on_gpfs_crash {
# if /primary/projects is not mounted, GPFS has crashed. Restart the system to fix this
if [ ! -d "/primary/projects" ]; then
  shutdown -r +5 "Automated system detected GPFS failure. $(hostname) will restart in 5 minutes."
  # send the report to syslog so that it Graylog can alert
  logger "Automated system detected GPFS failure. $(hostname) will restart in 5 minutes."
fi
}

reboot_on_gpfs_crash
