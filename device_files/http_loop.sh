i=0

while [ $i -lt 5 ]
do
    wget http://web1.inet/10Mbps_testfile -O /dev/null
    sleep 1
done
