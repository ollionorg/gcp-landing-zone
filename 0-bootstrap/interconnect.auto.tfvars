#### Dedicated interconnect configuration

d_region1_interconnect1_candidate_subnets = ["169.254.0.0/29"]
d_region1_interconnect1_vlan_tag8021q     = "3931"
d_region1_interconnect1_self_link         = "https://www.googleapis.com/compute/v1/projects/example-interconnect-project/global/interconnects/example-interconnect-1"
d_region1_interconnect1_location          = "las-zone1-770"
d_region1_interconnect2_candidate_subnets = ["169.254.0.8/29"]
d_region1_interconnect2_vlan_tag8021q     = "3932"
d_region1_interconnect2_self_link         = "https://www.googleapis.com/compute/v1/projects/example-interconnect-project/global/interconnects/example-interconnect-2"
d_region1_interconnect2_location          = "las-zone1-770"
d_region2_interconnect1_candidate_subnets = ["169.254.0.16/29"]
d_region2_interconnect1_vlan_tag8021q     = "3933"
d_region2_interconnect1_self_link         = "https://www.googleapis.com/compute/v1/projects/example-interconnect-project/global/interconnects/example-interconnect-3"
d_region2_interconnect1_location          = "lax-zone2-19"
d_region2_interconnect2_candidate_subnets = ["169.254.0.24/29"]
d_region2_interconnect2_vlan_tag8021q     = "3934"
d_region2_interconnect2_self_link         = "https://www.googleapis.com/compute/v1/projects/example-interconnect-project/global/interconnects/example-interconnect-4"
d_region2_interconnect2_location          = "lax-zone1-403"
d_peer_asn                                = "64515"
d_cloud_router_labels = {
  vlan_1 = "cr1",
  vlan_2 = "cr2",
  vlan_3 = "cr3",
  vlan_4 = "cr4"
}


##### restricted partner interconnect configuration


p_r_region1_interconnect1_location   = "las-zone1-770"
p_r_region1_interconnect2_location   = "las-zone1-770"
p_r_region2_interconnect1_location   = "lax-zone2-19"
p_r_region2_interconnect2_location   = "lax-zone1-403"
p_r_preactivate_partner_interconnect = true
p_r_cloud_router_labels = {
  vlan_1 = "cr5",
  vlan_2 = "cr6",
  vlan_3 = "cr7",
  vlan_4 = "cr8"
}

#### shared partner interconnect configuration

p_s_region1_interconnect1_location   = "las-zone1-770"
p_s_region1_interconnect2_location   = "las-zone1-770"
p_s_region2_interconnect1_location   = "lax-zone2-19"
p_s_region2_interconnect2_location   = "lax-zone1-403"
p_s_preactivate_partner_interconnect = true
p_s_cloud_router_labels = {
  vlan_1 = "cr1",
  vlan_2 = "cr2",
  vlan_3 = "cr3",
  vlan_4 = "cr4"
}


// interconnect-firewall
management-sub-ip_cidr_range = "10.0.0.0/24"
untrust-sub-ip_cidr_range    = "10.0.1.0/24"
trust-sub-ip_cidr_range      = "10.0.2.0/24"
allow-mgmt-source-ranges     = ["0.0.0.0/0"]
allow-inbound-source-ranges  = ["0.0.0.0/0"]
allow-outbound-source-ranges = ["0.0.0.0/0"]
trust-dest_range             = "0.0.0.0/0"
region_zone                  = "us-west1-a"
zone                         = "us-west1-a"
zone_2                       = "us-west1-b"

// Interconnect firewall
interconnect-firewall = true