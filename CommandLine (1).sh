#!/bin/sh
echo '1) Which location has the maximum number of purchases been made?'
awk -F ',' '{print $5}' df_bank.csv | sort | uniq -c | sort -nr | head -1

echo '2) In the dataset provided, did females spend more than males, or vice versa?' 
cut -f4,9 -d ',' df_bank.csv | grep "F" > F.csv 
cut -f4,9 -d ',' df_bank.csv | grep "M" > M.csv 
echo 'Males spend on average: ' 
awk -F ',' '{s+=$2} END {print s/NR}' M.csv 
echo 'Females spend on average: '
awk -F ',' '{s+=$2} END {print s/NR}' F.csv 
echo 'so Females spend more on average. (The average is used to have the right proportion because Females in the dataset are less than males)'

echo '3) Report the customer with the highest average transaction amount in the dataset'
cut -f2,9 -d ',' df_bank.csv > idtr.csv
awk -F ',' '{sum[$1]+=$2;count[$1]++;}END{for(i in sum)print i", "sum[i]/count[i];}' idtr.csv| sort -nrk2 | head -1

chmod +x CommandLine.sh

