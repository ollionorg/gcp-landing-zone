#base network ranges
base_vpc_firewall_egress_dest_ranges = ["10.0.0.0/16", "10.1.0.0/16", "100.64.0.0/16", "100.65.0.0/16"]
base_vpc_firewall_ingress_src_ranges = ["10.0.0.0/24", "10.1.0.0/24"]

#Restricted network ranges
rest_vpc_firewall_egress_dest_ranges = ["10.8.0.0/16", "10.9.0.0/16", "100.72.0.0/16", "100.73.0.0/16"]
rest_vpc_firewall_ingress_src_ranges = ["10.8.0.0/24", "10.9.0.0/24"]

### shared.auto.tfvars
target_name_server_addresses = ["192.168.0.1", "192.168.0.2"]
ingress_ranges_firewall      = ["192.168.0.0/16", "10.0.0.0/8", "172.16.0.0/12"] // Source IP address range in CIDR format. Required for INGRESS rules.
egress_ranges_firewall       = ["192.168.0.0/16", "10.0.0.0/8", "172.16.0.0/12"] // Destination IP address range in CIDR format. Required for EGRESS rules.

subnet_ip_cidr_range_region1 = "172.16.0.0/25"   //The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported.
subnet_ip_cidr_range_region2 = "172.16.0.128/25" //The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported.

base_vpc_global_address_private = {               // Global VPC created in common network for different environments.
  "d" = "10.16.64.0/21"  //development
  "s" = "10.16.128.0/21" //staging
  "p" = "10.16.192.0/21" //production
}

base_vpc_private_subnet_default_region = {        // environment based network for shared network in project.
  "d" = "10.0.64.0/21"
  "s" = "10.0.128.0/21"
  "p" = "10.0.192.0/21"
}

base_vpc_private_subnet_default_region2 = {
  "d" = "10.1.64.0/21"
  "s" = "10.1.128.0/21"
  "p" = "10.1.192.0/21"
}

base_vpc_subnet_secondary_ip_range_gke_pod = {
  "d" = ["100.64.64.0/21", "100.64.80.0/21"]
  "s" = ["100.64.128.0/21", "100.64.144.0/21"]
  "p" = ["100.64.192.0/21", "100.64.208.0/21"]
}

base_vpc_subnet_secondary_ip_range_gke_svc = {
  "d" = ["100.64.72.0/21", "100.64.88.0/21"]
  "s" = ["100.64.136.0/21", "100.64.152.0/21"]
  "p" = ["100.64.200.0/21", "100.64.216.0/21"]
}

rest_vpc_global_address_private = {
  "d" = "10.24.64.0/21"
  "s" = "10.24.128.0/21"
  "p" = "10.24.192.0/21"
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
