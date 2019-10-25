#!/usr/bin/env bash

# OutputString max characters can be modified in .tmux.conf

OutputString=""

# Time
Time="$(date +%H:%M)"
OutputString="$Time"

# Check the state of the system
#   - running
#   - BUILD
#   - SHUTDOWN
if ps ux | grep -q "[s]m_background"
then
  OutputString="running - $OutputString"
elif ps ux | grep -q "[u]t_sys_build"
then
  OutputString="BUILDING - $OutputString"
else
  OutputString="SHUTDOWN - $OutputString"
fi

# User logged in
while read Line ;
do
  User="$(grep $Line ~/.files/scripts/user_snooping/user_list )"
  if [ -z "$User" ]
  then
    LogFile="$(grep $Line ~/.files/scripts/user_snooping/unknown_users.log )"
    if [ -z "$LogFile" ]
    then
      LogString="Unknown IP: $Line"
      LogString="$LogString - $(date)"
      echo $LogString >> cool_shit_from_sam/unknown_users.log
    fi
    
  else
    LineArray=($User)
    Name="${LineArray[1]} ${LineArray[2]}"
    OutputString="$Name - $OutputString"
  fi
done <<< "$(w -hs | awk '{print $3}')"

echo -e ${OutputString}
