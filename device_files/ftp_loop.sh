i=0

while [ $i -lt 5 ]
do
    wget ftp://web1.inet/html/10Mbps_testfile -O /dev/null
    sleep 1
done
