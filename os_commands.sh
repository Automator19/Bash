# How to filter log file entries based on date
grep -E "JUN 27" | "JUN 28" logfile

# View all users cron jobs
for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l; done

# find longest running process
ps -eo etimes,pid,lstart,etime,args --sort -etimes

# Check Mount Status
awk '$4~/(^|,)ro($|,)/' /proc/mounts

# List all available packages including installed
yum --showduplicates list kernel

# Remove old kernels from OL8
yum remove --oldinstallonly --setopt installonly_limit=3 kernel

# backup sudoers file
cp /etc/sudoers /etc/sudoers.backup.$(date +"%Y_%m_%d_%I:%M:%S")

# Insert line after pattern (sed command)
sed -i '/pentest*/d' /etc/sudoers

# Du exclude mount points
for d in /*; do egrep " ${d} " /proc/mounts > /dev/null || du -sh ${d}; done

# Swap usage
 find /proc -maxdepth 2 -path "/proc/[0-9]*/status" -readable -exec awk -v FS=":" '{process[$1]=$2;sub(/^[ \t]+/,"",process[$1]);} END {if(process["VmSwap"] && process["VmSwap"] != "0 kB") printf "%10s %-30s %20s\n",process["Pid"],process["Name"],process["VmSwap"]}' '{}' \; | awk '{print $(NF-1),$0}' | sort -h | cut -d " " -f2-

# clear swap 
swapoff -a

# swapon
swapon -a

# Check last logged in user on linux
for file in /var/log/wtmp*; do awk -v file_="$file" -F: '{cmd = "last -F "file_" "$1; cmd | getline result; if(result != "") {printf "%s\n", result}}' /etc/passwd; done

# create a symlink
ln -s datafile pointer

# delete a symlink
rm pointer

# su to another user (edit visudo add line)
# user_from ALL=(ALL) NOPASSWD: /bin/su - user_to

# List Ciphers, Key Exchange and MACS
sshd -T | grep "\(ciphers\|macs\|kexalgorithms\)"

# Find zombie files
pstree -p 
ps -l 
ps -elf | grep Z
# Parent process fails to read the exit status of child process and it becomes ZZZZoombie. Parent process ID is labelled as PPID, parent ID of the child process orphaned has PPID of 1

# Who rebooted linux server ?
find /home | grep bash_history | xargs grep "reboot"

# Search user's history 
find /home -type f -iname .*history -exec grep "rm\|mv" {} \;
find /home | grep bash_history | xargs grep "mv"

# Who deleted files ?
find /home -type f -iname .*history -exec grep "rm\|mv" {} \;
grep 'file1' /home/*/.bash_history
for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l; done # Check cron jobs

# remove password expiry
chage -I -1 -m 0 -M 99999 -E -1 username

# generate sar logs
