#!/usr/bin/env bash

# OutputString can be a maximum of 40 characters

OutputString=""

# Who
Who="$(who | wc -l)"
OutputString="$Who"

# Time
Time="$(date +%H:%M)"
OutputString="$Time - $OutputString"

# Check the state of the system
#   - running
#   - BUILD
#   - SHUTDOWN
System="system"
if ps ux | grep -q "[s]m_background"
then
  OutputString="$System running - $OutputString"
elif ps ux | grep -q "[u]t_sys_build"
then
  OutputString="$System BUILD - $OutputString"
else
  OutputString="$System SHUTDOWN - $OutputString"
fi

echo ${OutputString}
