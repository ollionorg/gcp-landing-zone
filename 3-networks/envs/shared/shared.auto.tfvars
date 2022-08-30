shared_vpc_host_project                = "false"
delete_default_internet_gateway_routes = "true"            // If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation. Defaults to false
subnet_private_access                  = "true"            //When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access.
destination_range                      = "199.36.153.8/30" // The destination range of outgoing packets that this route applies to. Only IPv4 is supported.
next_hop_internet                      = "true"            //URL to a gateway that should handle matching packets. Currently, you can only specify the internet gateway, using a full or partial valid URL
enable_inbound_forwarding              = true              //When enabled, a virtual IP address will be allocated from each of the sub-networks that are bound to this policy.
advertised_ip_ranges                   = "35.199.192.0/19" // User-specified list of individual IP ranges to advertise in custom mode.
