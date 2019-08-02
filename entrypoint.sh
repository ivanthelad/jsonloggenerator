ips=("172.123.11.1" "12.45.234.11" "123.98.4.12" "98.56.123.2" "145.78.22.1")
httpstatus=("400" "403" "200" "202" "500" "403" "401" "500" "101" "301" "405" "505" "201" "202")
while true;       do
RANDOM=$$$(date +%s)
cp demo.json temp.json
ip=${ips[$RANDOM % ${#ips[@]}]}
sed -i "s/@ip@/$ip/g" temp.json
RANDOM=$$$(date +%s)
ip=${ips[$RANDOM % ${#ips[@]}]}
sed -i "s/@clientip@/$clientip/g" temp.json
RANDOM=$$$(date +%s)
ip=${ips[$RANDOM % ${#ips[@]}]}
sed -i "s/@targetip@/$targetip/g" temp.json
RANDOM=$$$(date +%s)
status=${httpstatus[$RANDOM % ${#httpstatus[@]}]}
sed -i "s/@httpstatus@/$status/g" temp.json


size=$(( ( RANDOM % 1000 )  + 1 ))
sed -i "s/@response@/$size/g" temp.json

awk -v RS= '{$1=$1}1' temp.json  >> /tmp/mylog.json;            i=$((i+1));     1>&2 echo $(cat temp.json)   sleep 1; done ;
