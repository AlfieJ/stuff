#!/bin/sh

me=`stat -f "%Su" /dev/console`

vmrun=/Applications/VMWare\ Fusion.app/Contents/Library/vmrun
if [ ! -f "$vmrun" ]; then
	echo "$0: vmrun is not installed at the usual location, exiting."
	exit
fi

vm_cookie_file="/tmp/com.bombich.ccc.running_vm_containers"
if [ ! -f "$vm_cookie_file" ]; then
	echo "$0: The VM container cookie file is empty or missing, exiting."
	exit
fi

vm_list=`/bin/cat "$vm_cookie_file"`

for vm in $vm_list; do
	echo "VMware postflight: Starting $vm"
	sudo -u $me "$vmrun" start "$vm"
done

/bin/rm "$vm_cookie_file" 2>/dev/null
