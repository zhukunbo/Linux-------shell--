#########################################################################
# File Name: test.sh
# Author: xiaozhu_9527
# mail: 13478604660@163.com
# Created Time: Sat 09 Apr 2016 08:27:58 PM CST
#########################################################################
#!/bin/bash

df -hP | egrep -v "Filesystem|tmpfs" | awk 'BEGIN{sum=0}{
sum+=$3
}
END{print sum}'

