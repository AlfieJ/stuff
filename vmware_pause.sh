#!/bin/sh

me=`stat -f "%Su" /dev/console`

vmrun=/Applications/VMWare\ Fusion.app/Contents/Library/vmrun
if [ ! -f "$vmrun" ]; then
	echo "$0: vmrun is not installed at the usual location, exiting."
	exit
fi

vm_list=`sudo -u $me "$vmrun" list`
vm_cookie_file="/tmp/com.bombich.ccc.running_vm_containers"
/bin/rm "$vm_cookie_file" 2>/dev/null

for vm in $vm_list; do
    if [ -f "$vm" ]; then
        echo "VMware preflight: Pausing $vm"
        sudo -u $me "$vmrun" suspend "$vm"
        echo "$vm" >> "$vm_cookie_file"
    fi
done
