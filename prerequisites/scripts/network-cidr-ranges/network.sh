#!/bin/bash

## Generates the CIDR ranges based on the CIDR supplied to it and saves in a file
## This script takes input CIDR for subnet in environment specific VPC's and shared hub VPC,
## If the values are not passed while executing the script, default values will be used.

## Default values
INPUT_CIDR="${1:-10.0.0.0/16}"
SHARED_INPUT_CIDR="${2:-172.16.0.0/25}"
GKE_CIDR="${3:-100.64.0.0/16}"

: "${NUM_OF_SUBNETS:=32}"
: "${ENVS:=d,s,p}"

REGEX='(((25[0-5]|2[0-4][0-9]|1?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|1?[0-9][0-9]?))(\/([8-9]|[1-2][0-9]|3[0-2]))([^0-9.]|$)'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;1;33m'
NC='\033[0m'
FILE="../../../0-bootstrap/networks.auto.tfvars"

sleep 1
if ! command -v ipcalc &>/dev/null; then
	echo -e "\n${RED} Looks like ${GREEN}ipcalc${RED} utility is missing on your machine${NC} \n NOTE: This script requires ipcalc to validate the CIDR's "
	echo -e " ${GREEN}Follow instructions on installing ipcalc on your machine \n ${RED}Exiting ... ${YELLOW}:)${NC} \n"
	exit
fi

echo -e " \n${GREEN} Running the script to create CIDR's that will be added to ${BLUE}networks.auto.tfvars ${GREEN}in ${BLUE}0-bootstrap ${GREEN}and used in later stages for creating the networks. ${YELLOW}"
read -rp " Press any key to continue "
echo -e "${NC}"
sleep 1

## Number of environments.
env_count=$(echo $ENVS | tr "," " " | wc -w)
if ((env_count < 4)); then
	# In default case, total subnets possible from /16 to /21 is be 32, i.e The group size will be 8. So the subnet division can be in multiples of 8
	subnet_div=64
else
	subnet_div=32
fi

#Splitting the CIDR for further use and storing into variables
#environments
NW_ADDR=$(echo "$INPUT_CIDR" | awk -F'/' '{ print $1 }')
NW_MASK=$(echo "$INPUT_CIDR" | awk -F'/' '{ print $2 }')
oct1=$(echo "$NW_ADDR" | awk -F"." '{print $1}')
oct2=$(echo "$NW_ADDR" | awk -F"." '{print $2}')
oct3=$(echo "$NW_ADDR" | awk -F"." '{print $3}')
oct4=$(echo "$NW_ADDR" | awk -F"." '{print $4}')

#shared
C_NW_ADDR=$(echo "$SHARED_INPUT_CIDR" | awk -F'/' '{ print $1 }')
C_NW_MASK=$(echo "$SHARED_INPUT_CIDR" | awk -F'/' '{ print $2 }')
coct1=$(echo "$C_NW_ADDR" | awk -F"." '{print $1}')
coct2=$(echo "$C_NW_ADDR" | awk -F"." '{print $2}')
coct3=$(echo "$C_NW_ADDR" | awk -F"." '{print $3}')
coct4=$(echo "$C_NW_ADDR" | awk -F"." '{print $4}')

#GKE secondary ranges
G_NW_ADDR=$(echo "$GKE_CIDR" | awk -F'/' '{ print $1 }')
G_NW_MASK=$(echo "$GKE_CIDR" | awk -F'/' '{ print $2 }')
goct1=$(echo "$G_NW_ADDR" | awk -F"." '{print $1}')
goct2=$(echo "$G_NW_ADDR" | awk -F"." '{print $2}')
goct3=$(echo "$G_NW_ADDR" | awk -F"." '{print $3}')
goct4=$(echo "$G_NW_ADDR" | awk -F"." '{print $4}')

FIREWALL_DEST_HOST_BITS=$NW_MASK

# New subnet mask based on the required number of subnets (NUM_OF_SUBNETS).
SUB_MASK_SHIFT=$(awk 'BEGIN { rounded = sprintf("%.0f", '"$(echo 'l('"$NUM_OF_SUBNETS"')/l(10)' | bc -l)"'/'"$(echo 'l(2)/l(10)' | bc -l)"'); print rounded }')

NEW_NW_MASK="$((NW_MASK + SUB_MASK_SHIFT))"
NEW_GKE_MASK="$((G_NW_MASK + SUB_MASK_SHIFT))"

#if [[ $oct3 -ne 0 ]] && [[ $coct3 -ne 0 ]] && [[ $goct3 -ne 0 ]]; then
#	echo "Please modify the input CIDR/CIDR's. e.g 10.0.0.0/16"
#fi

## Validate the subnet with the help of ipcalc tool
validator() {
	ip=$1
	binary=$(ipcalc "$ip" | awk '/Address/ {print $4}' | awk -F"." '{print $1 $2}')
	if [[ $((2#$binary)) -eq 0 ]]; then
		return 0
	else
		return 1
	fi
}

## Validating the CIDRs supplied in input
if [[ $INPUT_CIDR =~ $REGEX ]] && [[ $SHARED_INPUT_CIDR =~ $REGEX ]] && [[ $GKE_CIDR =~ $REGEX ]]; then
	if ! validator "$INPUT_CIDR"; then
		echo " INPUT CIDR = ${INPUT_CIDR}"
		echo -e " ${RED}INVALID INPUT CIDR${NC} Please run the script with valid CIDR e.g ${RED}10.2.0.0/16${NC} Exiting..."
		exit 1
	fi

	if ! validator "$SHARED_INPUT_CIDR"; then
		echo " SHARED CIDR input = ${SHARED_INPUT_CIDR}"
		echo -e " ${RED}INVALID SHARED_INPUT_CIDR${NC} Please run the script with valid CIDR e.g ${RED}172.0.0.0/25${NC} Exiting..."
		exit 1
	fi

	if ! validator "$GKE_CIDR"; then
		echo " GKE CIDR input = ${GKE_CIDR}"
		echo -e " ${RED}INVALID GKE_CIDR${NC} Please run the script with valid CIDR e.g ${RED}100.64.0.0/16${NC} Exiting..."
		exit 1
	fi
else
	echo -e "${RED}CIDR entered does not match REGEX. Please enter valid CIDR${NC} Exiting"
	exit 1
fi

#validate last subnet
lastIp="$oct1.$((oct2 + 32)).$((oct3 + env_count * subnet_div)).$oct4/$NEW_NW_MASK"

if [[ $lastIp =~ $REGEX ]]; then
	if ! validator "$lastIp"; then
		echo "Please modify the range, second octet out of valid CIDR"
		exit 1
	fi
else
	echo -e "Last IP address : ${RED}$lastIp${NC} is out of range."
	echo "Unable to divide the network. Please modify the input range. Exiting"
	exit 1
fi

echo '
// Creating CIDRs using script

// shared/common hub network subnets
subnet_ip_cidr_range_region1 = "'$coct1.$coct2.$coct3.$coct4/$C_NW_MASK'"
subnet_ip_cidr_range_region2 = "'$coct1.$coct2.$coct3.$((coct4 + 128))/$C_NW_MASK'"

// IP address range supplied as an input to reserve a specific address in a network - Internal
// https://cloud.google.com/service-infrastructure/docs/enabling-private-services-access
base_vpc_global_address_private = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '"'"$oct1".$((oct2 + 16)).$((oct3 + i * subnet_div))."$oct4"/"$NEW_NW_MASK"'"'
done)"'
}

rest_vpc_global_address_private = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '"'"$oct1".$((oct2 + 24)).$((oct3 + i * subnet_div))."$oct4"/"$NEW_NW_MASK"'"'
done)"'
}

// VPC subnets
base_vpc_private_subnet_default_region = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '"'"$oct1".$((oct2)).$((oct3 + i * subnet_div))."$oct4"/"$NEW_NW_MASK"'"'
done)"'
}

base_vpc_private_subnet_default_region2 = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '"'"$oct1".$((oct2 + 1)).$((oct3 + i * subnet_div))."$oct4"/"$NEW_NW_MASK"'"'
done)"'
}

rest_vpc_private_subnet_default_region = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '"'"$oct1".$((oct2 + 8)).$((oct3 + i * subnet_div))."$oct4"/"$NEW_NW_MASK"'"'
done)"'
}

rest_vpc_private_subnet_default_region2 = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '"'"$oct1".$((oct2 + 9)).$((oct3 + i * subnet_div))."$oct4"/"$NEW_NW_MASK"'"'
done)"'
}

// secondary subnet ranges
base_vpc_subnet_secondary_ip_range_gke_pod = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '["'"$goct1".$goct2.$((goct3 + i * subnet_div))."$goct4"/"$NEW_GKE_MASK"'", "'"$goct1".$goct2.$((goct3 + i * subnet_div + 16))."$goct4"/"$NEW_GKE_MASK"'"]'
done)"'
}

base_vpc_subnet_secondary_ip_range_gke_svc = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '["'"$goct1".$goct2.$((goct3 + i * subnet_div + 8))."$goct4"/"$NEW_GKE_MASK"'" , "'"$goct1".$goct2.$((goct3 + i * subnet_div + 24))."$goct4"/"$NEW_GKE_MASK"'"]'
done)"'
}

rest_vpc_subnet_secondary_ip_range_gke_pod = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '"'"$goct1".$((goct2 + 8)).$((goct3 + i * subnet_div))."$goct4"/"$NEW_GKE_MASK"'"'
done)"'
}

rest_vpc_subnet_secondary_ip_range_gke_svc = {
'"$(for i in $(seq "${env_count}"); do
	env_code=$(echo $ENVS | awk -F"," '{print $('"$i"')}')
	echo '"'"$env_code"'"' = '"'"$goct1".$((goct2 + 8)).$((goct3 + i * subnet_div + 8))."$goct4"/"$NEW_GKE_MASK"'"'
done)"'
}

target_name_server_addresses = ["192.168.0.1","192.168.0.2"]
ingress_ranges_firewall      = ["192.168.0.0/16", "'$oct1.$oct2.$oct3.$coct4/8'", "'$coct1.$coct2.$coct3.$coct4/12'"]
egress_ranges_firewall       = ["192.168.0.0/16", "'$oct1.$oct2.$oct3.$coct4/8'", "'$coct1.$coct2.$coct3.$coct4/12'"]

// Base and restricted
base_vpc_firewall_egress_dest_ranges = ["'$oct1.$oct2.$oct3.$oct4/$FIREWALL_DEST_HOST_BITS'","'$oct1.$((oct2 + 1)).$oct3.$oct4/$FIREWALL_DEST_HOST_BITS'","'$goct1.$goct2.$goct3.$goct4/$G_NW_MASK'","'$goct1.$((goct2 + 1)).$goct3.$goct4/$G_NW_MASK'"]
base_vpc_firewall_ingress_src_ranges = ["'$oct1.$oct2.$oct3.$oct4/$((NEW_NW_MASK + 3))'","'$oct1.$((oct2 + 1)).$oct3.$oct4/$((NEW_NW_MASK + 3))'"]
rest_vpc_firewall_egress_dest_ranges = ["'$oct1.$((oct2 + 8)).$oct3.$oct4/$FIREWALL_DEST_HOST_BITS'","'$oct1.$((oct2 + 9)).$oct3.$oct4/$FIREWALL_DEST_HOST_BITS'","'$goct1.$((goct2 + 8)).$goct3.$goct4/$G_NW_MASK'","'$goct1.$((goct2 + 9)).$goct3.$goct4/$G_NW_MASK'"]
rest_vpc_firewall_ingress_src_ranges = ["'$oct1.$((oct2 + 8)).$oct3.$oct4/$((NEW_NW_MASK + 3))'","'$oct1.$((oct2 + 9)).$oct3.$oct4/$((NEW_NW_MASK + 3))'"]


' >>$FILE
echo -e "\n${GREEN} SUCCESS !!${YELLOW} ヽ(•‿•)ノ ${NC} \n"
echo -e " Subnets created. Please review at ${BLUE}$FILE${NC} \n"
