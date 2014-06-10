#!/bin/sh
### BEGIN INIT INFO
# Provides:          startvm
# Required-Start:    
# Required-Stop:     
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts virtualbox os
# Description:       starts virtualbox centos65, acpipowerbutton|poweroff
### END INIT INFO

case "$1" in
start)
	vboxmanage startvm "centos65" -type headless
	;;

stop)
	vboxmanage controlvm "centos65" acpipowerbutton
	;;

esac

