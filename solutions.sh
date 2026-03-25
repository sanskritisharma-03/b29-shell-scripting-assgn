nano disk_usage_monitor.sh
#!/bin/bash
disk_space=$(df -h / | awk 'NR==2 {print $5}') #this is how we get the disk usage of the root directory 
disk_space=$(disk_space%/%) #this is how we remove the percentage sign, hence we get a number

limit= 80 #threshold mentioned
if ["$disk_space" -gt "$limit"]; then
    echo "warning:disk space has almost reached its limit, empty soon"
fi

chmod +x disk_usage_monitor.sh #makes the script executable 
./disk_usage_monitor.sh


##this one takes line command-first deliverable 

nano disk_usage_monitor.sh

#!/bin/bash

limit=$1 #takes input from command line
disk_space=$(df -h / | tail -1 | awk '{print $(NF-1)}') ##this is how we get the disk usage of the root directory, from the last line and second last column
disk_space=${disk_space%\%}  #this is how we remove the percentage sign, hence we get a number

echo "storge info: usage is $disk_space"

if [ "$disk_space" -gt "$limit" ]; then
    echo "warning: disk about to get full soon"  #condition placed 
fi

chmod +x disk_usage_monitor.sh #makes the script executable 
./disk_usage_monitor.sh 75 #this is threshold limit our choice



#this one deals with mount partitions (i faced difficulties in this part,yet to study more on this)

nano disk_usage_monitor.sh

#!/bin/bash

limit=${1:-80} #this is basically a one line command, also if user gives the value then we can use that or else 80 as default

df -h | awk 'NR>1 {print $5 " " $6}' | while read output;
do
    disk_space=$(echo $output | awk '{print $1}' | sed 's/%//')
    partition=$(echo $output | awk '{print $2}')

    if [ "$disk_space" -gt "$limit" ]; then
        echo "Warning: the space used by your disk has exceeded on $partition"
    fi
done

chmod +x disk_usage_monitor.sh 
./disk_usage_monitor.sh
