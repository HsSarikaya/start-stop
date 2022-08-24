#!/bin/bash
### BEGIN INIT INFO
# Provides:          stopper
# Required-Start:    $network $syslog
# Required-Stop:    $network $syslog
# Default-Start:    3 4 5
# Default-Stop:      0 1 6
### END INIT INFO
threshold=0.03

count=0
wait_minutes=2
while true
do

  load=$(uptime | sed -e 's/.*load average: //g' | awk '{ print $1 }') # 1-minute average load
  load="${load//,}" # remove trailing comma
  res=$(echo $load'<'$threshold | bc -l)
  if (( $res ))
  then
    echo "Idling.."
    ((count+=1))
  fi
  echo "Idle minutes count = $count"

  if (( count>wait_minutes ))
  then
    echo Shutting down
    # wait a little bit more before actually pulling the plug
    sleep 60
    sudo poweroff
  fi

  sleep 60

done
