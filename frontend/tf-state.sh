#!/bin/bash

#The script traverses through all the directories with terraform state file and fetches the output of terraform show -json unified into a single json file inside an array.

touch tf-inventory.json
echo -e "[" >> tf-inventory.json

for i in $(find ../. -not -path "*/BU_NAME/*" -type f -name "backend.tf" | sort)
do

echo "Getting TF State for $i"
terraform -chdir=$(dirname $i) init -reconfigure > /dev/null 2>&1
terraform -chdir=$(dirname $i) show -json >> tf-inventory.json

#check for resources and then add , otherwise skip OR {},
if [ $? == 0 ]
then
echo -e "," >> tf-inventory.json
fi

done

sed '$s/,//g' tf-inventory.json > tf-state-inventory.json

echo -e "]" >> tf-state-inventory.json

rm -f tf-inventory.json