# stuff
Miscellaneous things

vmware_pause.sh and vmware_start.sh are shell scripts I got from Mike Bombich to use with Carbon Copy Cloner. They were originally written to pause/restart Parallels VMs, but I tweaked them to work with VMWare.

They use the command-line tools VMWare Fusion provides to pause all the running VMs, then restart them. Prior to running the backup, the running VMs are written to a file, then they are paused. After the backup completes, the VMs that were paused are read from the file and restarted.
