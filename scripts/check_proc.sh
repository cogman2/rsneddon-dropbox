#!/usr/local/bin/bash
#
# Checks a process at time intervals
#set -x
echo -n "Enter your process ID number: "; read proc_id
echo "Process ID is: $proc_id "
ps -p $proc_id
while [  $? -eq 0 ];
do
    echo "Still running process $proc_id "
    sleep 30s
    ps -p $proc_id
done
echo "Process $proc_id finished"
#ps -p $proc_id && sleep 3 s || echo "Process $proc_id is finished"
    