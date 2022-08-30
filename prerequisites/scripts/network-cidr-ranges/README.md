
# 3-Network pre-requisite CIDR script to create subnets from user defined starting CIDR

The following script can be used in case client has a requirenment to use a specific CIDR range while setting up VPC networks for projects.
Here hub and spoke model is implemented. The script adds required variables into networks.auto.tfvars file under 0-bootstrap. These variables are later utilized in 3-networks.



## Argument reference and default values

| Name             |   Positional arg  |Default        | Description                                                       |
| --------------|------- | ------------------- | ----------------------------------------------- |
| `INPUT_CIDR`   | `$1` | `10.0.0.0/16` | Starting CIDR block to create subnets. |
| `SHARED_INPUT_CIDR` | `$2` | `172.16.0.0/25` | Starting subnet range for creating subnets for shared hub VPC. |
| `GKE_CIDR` | `$3` | `100.64.0.0/16` | CIDR range for creating subnets for GKE. |

###
_**Note**: The above default values can be modified while running the script by passing as positional argumnents respectively._
***
### variables
| Name             | Default          | Description                                                     |
| ----------------- | -------------- | ---------------------------------------------------- |
| `ENVS` | `d,s,p` | Environment code for each environment.|
| `NUM_OF_SUBNETS` | `32` | Number of subnets required. | 

## Example usuage

To generate the subnets with default values run the below command,
Defaults : `ENVS=d,s,p` `INPUT_CIDR:10.0.0.0/16`
`SHARED_INPUT_CIDR:172.16.0.0/25` `GKE_CIDR:100.64.0.0/16`

```bash
  ./network.sh 
```
To override the `INPUT_CIDR` specify the desired CIDR while running the script.
```bash
  ./network.sh 10.20.0.0/16 
```
#### Modify environment codes

Declare the value for `ENVS` while running the script
e.g
```bash
ENVS=d,s,p ./network.sh
```

### 
### For more information please refer https://cloud.google.com/architecture/security-foundations/networking
## Example
### command
```bash
./network.sh
```
### output
```bash
//Creating CIDRs using script

// shared/common hub network subnets
subnet_ip_cidr_range_region1 = "172.16.0.0/25"
subnet_ip_cidr_range_region2 = "172.16.0.128/25"

// IP address range supplied as an input to reserve a specific address in a network - Internal
// https://cloud.google.com/service-infrastructure/docs/enabling-private-services-access
base_vpc_global_address_private = {
"d" = "10.16.64.0/21"
"s" = "10.16.128.0/21"
"p" = "10.16.192.0/21"
}

rest_vpc_global_address_private = {
"d" = "10.24.64.0/21"
"s" = "10.24.128.0/21"
"p" = "10.24.192.0/21"
}

// VPC subnets
base_vpc_private_subnet_default_region = {
"d" = "10.0.64.0/21"
"s" = "10.0.128.0/21"
"p" = "10.0.192.0/21"
}

base_vpc_private_subnet_default_region2 = {
"d" = "10.1.64.0/21"
"s" = "10.1.128.0/21"
"p" = "10.1.192.0/21"
}

rest_vpc_private_subnet_default_region = {
"d" = "10.8.64.0/21"
"s" = "10.8.128.0/21"
"p" = "10.8.192.0/21"
}

rest_vpc_private_subnet_default_region2 = {
"d" = "10.9.64.0/21"
"s" = "10.9.128.0/21"
"p" = "10.9.192.0/21"
}

//secondary subnet ranges
base_vpc_subnet_secondary_ip_range_gke_pod = {
"d" = "100.64.64.0/21"
"s" = "100.64.128.0/21"
"p" = "100.64.192.0/21"
}

base_vpc_subnet_secondary_ip_range_gke_svc = {
"d" = "100.64.72.0/21"
"s" = "100.64.136.0/21"
"p" = "100.64.200.0/21"
}

rest_vpc_subnet_secondary_ip_range_gke_pod = {
"d" = "100.72.64.0/21"
"s" = "100.72.128.0/21"
"p" = "100.72.192.0/21"
}

rest_vpc_subnet_secondary_ip_range_gke_svc = {
"d" = "100.72.72.0/21"
"s" = "100.72.136.0/21"
"p" = "100.72.200.0/21"
}

target_name_server_addresses = ["192.168.0.1","192.168.0.2"]
ingress_ranges_firewall      = ["192.168.0.0/16", "10.0.0.0/8", "172.16.0.0/12"]
egress_ranges_firewall       = ["192.168.0.0/16", "10.0.0.0/8", "172.16.0.0/12"]

//Base and restricted
base_vpc_firewall_egress_dest_ranges = ["10.0.0.0/16","10.1.0.0/16","100.64.0.0/16","100.65.0.0/16"]
base_vpc_firewall_ingress_src_ranges = ["10.0.0.0/24","10.1.0.0/24"]
rest_vpc_firewall_egress_dest_ranges = ["10.8.0.0/16","10.9.0.0/16","100.72.0.0/16","100.73.0.0/16"]
rest_vpc_firewall_ingress_src_ranges = ["10.8.0.0/24","10.9.0.0/24"]

```