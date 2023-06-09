######       This Terraform Template Builds a
###       Load Balancer Sandwich with VM-Series in GCP

#locals

locals {
  #  public_key                   = data.terraform_remote_state.bootstrap.outputs.public_key
  #  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5anyFJBnA8+AXN1qhuSZYPYgtSX8bbgqp857gnERZV9SPAlg4Fm+K7CeLk1SenEJ7pPh5WUUhcjig4yQWtU6ag3eKMGVWesnWDiiYfpNg2kPUD42NBySzGKwgzaQxaN1NZJ8Hy5iNGj0lI2KV0DIwIf/f++5RNVa7nrekK5GZKW7v2Xgn0qCuVHxj0+b64ra3ogVRaVe9OFdmpwAho0ws+qC6aH9YyAnhR6mPGWtKIpOry0CP/STPQwrkQ+tI1L46X/Iz3SysAR76SyqrvqPa8YKnOIU4TbPJiiK1+dFTpgc4rF7+bj0ALh0X00DqYoTkbdgx2Y487jTQq93EXKzJ5QA1mwC6l3AESjIU+0RO91ngwItHJ+00XDzKivJ4ZKLr0ROzEa5jRFnNMFgBLdNgeJfjFvouI1I6olL+IOsBw56foCNYS4cVliNVrL4dtBLiT5fyr4DzU9JlYnp4MTzG1e7uzmQyjZHFa9TpaZ3RdrKHVsibxmKGu2L5SYnyyzs= amankumarsingh@Aman-Kumar-Singh.local"
  management-sub-ip_cidr_range = data.terraform_remote_state.bootstrap.outputs.management-sub-ip_cidr_range
  untrust-sub-ip_cidr_range    = data.terraform_remote_state.bootstrap.outputs.untrust-sub-ip_cidr_range
  trust-sub-ip_cidr_range      = data.terraform_remote_state.bootstrap.outputs.trust-sub-ip_cidr_range
  allow-mgmt-source-ranges     = data.terraform_remote_state.bootstrap.outputs.allow-mgmt-source-ranges
  allow-outbound-source-ranges = data.terraform_remote_state.bootstrap.outputs.allow-outbound-source-ranges
  allow-inbound-source-ranges  = data.terraform_remote_state.bootstrap.outputs.allow-inbound-source-ranges
  trust-dest_range             = data.terraform_remote_state.bootstrap.outputs.trust-dest_range
  project_name                 = data.terraform_remote_state.bootstrap.outputs.project_name
  default_region               = data.terraform_remote_state.bootstrap.outputs.gcp_region
  region_zone                  = data.terraform_remote_state.bootstrap.outputs.region_zone
  zone                         = data.terraform_remote_state.bootstrap.outputs.zone
  zone_2                       = data.terraform_remote_state.bootstrap.outputs.zone_2
  firewall_name                = data.terraform_remote_state.bootstrap.outputs.firewall_name
  image_fw                     = data.terraform_remote_state.bootstrap.outputs.image_fw
  machine_type_fw              = data.terraform_remote_state.bootstrap.outputs.machine_type_fw
  machine_cpu_fw               = data.terraform_remote_state.bootstrap.outputs.machine_cpu_fw
  bootstrap_bucket_fw          = data.terraform_remote_state.bootstrap.outputs.bootstrap_bucket_fw
  interface_0_name             = data.terraform_remote_state.bootstrap.outputs.interface_0_name
  interface_1_name             = data.terraform_remote_state.bootstrap.outputs.interface_1_name
  interface_2_name             = data.terraform_remote_state.bootstrap.outputs.interface_2_name
  scopes_fw                    = data.terraform_remote_state.bootstrap.outputs.scopes_fw
  web_server_name              = data.terraform_remote_state.bootstrap.outputs.web_server_name
  machine_type_web             = data.terraform_remote_state.bootstrap.outputs.machine_type_web
  image_web                    = data.terraform_remote_state.bootstrap.outputs.image_web
  scopes_web                   = data.terraform_remote_state.bootstrap.outputs.scopes_web

}
/*
// Adding SSH Public Key Project Wide
resource "google_compute_project_metadata_item" "ssh-keys1" {
  count = local.interconnect-firewall ? 1 : 0
  key   = "ssh-keys1"
  value = local.public_key
}
*/
// Adding VPC Networks to Project  MANAGEMENT
resource "google_compute_subnetwork" "management-sub" {
  count         = local.interconnect-firewall ? 1 : 0
  name          = "paloalto-management-sub"
  project       = local.interconnect_no_trust_project_id
  ip_cidr_range = local.management-sub-ip_cidr_range
  network       = google_compute_network.management[count.index].id
  region        = local.default_region2
}

resource "google_compute_network" "management" {
  count                   = local.interconnect-firewall ? 1 : 0
  project                 = local.interconnect_no_trust_project_id
  name                    = local.interface_0_name
  auto_create_subnetworks = "false"
}

// Adding VPC Networks to Project  UNTRUST
resource "google_compute_subnetwork" "untrust-sub" {
  count         = local.interconnect-firewall ? 1 : 0
  name          = "paloalto-untrust-sub"
  project       = local.interconnect_no_trust_project_id
  ip_cidr_range = local.untrust-sub-ip_cidr_range
  network       = google_compute_network.untrust[0].id
  region        = local.default_region2
}

resource "google_compute_network" "untrust" {
  count                   = local.interconnect-firewall ? 1 : 0
  project                 = local.interconnect_no_trust_project_id
  name                    = local.interface_1_name
  auto_create_subnetworks = "false"
}

// Adding VPC Networks to Project  TRUST
resource "google_compute_subnetwork" "trust-sub" {
  count         = local.interconnect-firewall ? 1 : 0
  name          = "paloalto-trust-sub"
  project       = local.interconnect_no_trust_project_id
  ip_cidr_range = local.trust-sub-ip_cidr_range
  network       = google_compute_network.trust[0].id
  region        = local.default_region2
}

resource "google_compute_network" "trust" {
  count                   = local.interconnect-firewall ? 1 : 0
  project                 = local.interconnect_no_trust_project_id
  name                    = local.interface_2_name
  auto_create_subnetworks = "false"
}

// Adding GCP Firewall Rules for MANGEMENT
resource "google_compute_firewall" "allow-mgmt" {
  count   = local.interconnect-firewall ? 1 : 0
  name    = "paloalto-allow-mgmt"
  project = local.interconnect_no_trust_project_id
  network = google_compute_network.management[0].id
  allow {
    protocol = "all"

    #ports    = ["all"]
  }


  source_ranges = local.allow-mgmt-source-ranges
}

// Adding GCP Firewall Rules for INBOUND
resource "google_compute_firewall" "allow-inbound" {
  count   = local.interconnect-firewall ? 1 : 0
  name    = "paloalto-allow-inbound"
  project = local.interconnect_no_trust_project_id
  network = google_compute_network.untrust[0].name

  allow {
    protocol = "all"

    #ports    = ["all"]
  }

  source_ranges = local.allow-inbound-source-ranges
}

// Adding GCP Firewall Rules for OUTBOUND
resource "google_compute_firewall" "allow-outbound" {
  count   = local.interconnect-firewall ? 1 : 0
  name    = "paloalto-allow-outbound"
  project = local.interconnect_no_trust_project_id
  network = google_compute_network.trust[count.index].name

  allow {
    protocol = "all"

    # ports    = ["all"]
  }

  source_ranges = local.allow-outbound-source-ranges
}

// Adding GCP ROUTE to TRUST Interface
resource "google_compute_route" "trust" {
  count                  = local.interconnect-firewall ? 3 : 0
  name                   = "paloalto-trust-route-${count.index + 1}"
  dest_range             = local.trust-dest_range
  project                = local.interconnect_no_trust_project_id
  network                = google_compute_network.trust[0].name
  next_hop_instance      = element(google_compute_instance.firewall.*.name, count.index)
  next_hop_instance_zone = local.zone
  priority               = 100

  depends_on = [google_compute_instance.firewall,
    google_compute_network.trust,
    google_compute_network.untrust,
    google_compute_network.management,
  ]
}

// Create a new PAN-VM instance
resource "google_compute_instance" "firewall" {
  count                     = local.interconnect-firewall ? 3 : 0
  name                      = "${local.firewall_name}-${count.index + 1}"
  project                   = local.interconnect_no_trust_project_id
  machine_type              = local.machine_type_fw
  zone                      = local.zone
  min_cpu_platform          = local.machine_cpu_fw
  can_ip_forward            = true
  allow_stopping_for_update = true

  // Adding METADATA Key Value pairs to GCE VM
  metadata = {
    // initconfig.txt will perform interface swap of VM-series on bootstrap

    //  vmseries-bootstrap-gce-storagebucket = var.bootstrap_bucket_fw
    serial-port-enable = true

    //sshKeys                              = "${local.public_key}"
    //ssh keys and firewall inbound all
  }

  service_account {
    scopes = local.scopes_fw
  }

  // Swapped Interface for Load Balancer
  network_interface {
    #    subnetwork    = google_compute_subnetwork.untrust-sub[count.index]

    subnetwork = google_compute_subnetwork.untrust-sub[0].id
    #    access_config {
    #
    #    }
  }

  network_interface {
    #    subnetwork    = google_compute_subnetwork.management-sub[count.index]
    subnetwork = google_compute_subnetwork.management-sub[0].id
  }

  network_interface {
    #subnetwork = google_compute_subnetwork.trust-sub[count.index]
    subnetwork = google_compute_subnetwork.trust-sub[0].id

  }

  boot_disk {
    initialize_params {
      image = var.image_fw
    }
  }
}

###########################################
###################  ELB & ILB  LOAD BALANCER and WEB SERVER SETUP BELOW      #############
######################################

resource "google_compute_global_address" "external-address" {
  count        = local.interconnect-firewall ? 1 : 0
  project      = local.interconnect_no_trust_project_id
  name         = "tf-external-address"
  purpose      = "PRIVATE_SERVICE_CONNECT"
  network      = google_compute_network.untrust[0].id
  address_type = "INTERNAL"
  address      = "10.11.0.10"
}

resource "google_compute_instance_group" "fw-ig" {
  count     = local.interconnect-firewall ? 1 : 0
  zone      = local.zone
  name      = "fw-ig"
  project   = local.interconnect_no_trust_project_id
  instances = google_compute_instance.firewall.*.id

  named_port {
    name = "http"
    port = "80"
  }
}

resource "google_compute_health_check" "health-check" {
  count   = local.interconnect-firewall ? 1 : 0
  project = local.interconnect_no_trust_project_id
  name    = "elb-health-check"

  http_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "fw-backend" {
  count    = local.interconnect-firewall ? 1 : 0
  name     = "fw-backend"
  project  = local.interconnect_no_trust_project_id
  protocol = "HTTP"

  backend {
    group = google_compute_instance_group.fw-ig[0].id
  }

  health_checks = [google_compute_health_check.health-check[count.index].id]
}

resource "google_compute_url_map" "http-elb" {
  count           = local.interconnect-firewall ? 1 : 0
  name            = "http-elb"
  project         = local.interconnect_no_trust_project_id
  default_service = google_compute_backend_service.fw-backend[count.index].id
}

resource "google_compute_target_http_proxy" "http-lb-proxy" {
  count   = local.interconnect-firewall ? 1 : 0
  name    = "tf-http-lb-proxy"
  project = local.interconnect_no_trust_project_id
  url_map = google_compute_url_map.http-elb[count.index].id
}

resource "google_compute_global_forwarding_rule" "default" {
  count      = local.interconnect-firewall ? 1 : 0
  name       = "http-content-gfr"
  target     = google_compute_target_http_proxy.http-lb-proxy[count.index].id
  project    = local.interconnect_no_trust_project_id
  port_range = "80"
}


resource "google_compute_health_check" "my-tcp-health-check" {
  count   = local.interconnect-firewall ? 1 : 0
  project = local.interconnect_no_trust_project_id
  name    = "my-tcp-health-check"

  tcp_health_check {
    port = "80"
  }
}

resource "google_compute_region_backend_service" "my-int-lb" {
  count         = local.interconnect-firewall ? 1 : 0
  name          = "my-int-lb"
  project       = local.interconnect_no_trust_project_id
  health_checks = [google_compute_health_check.my-tcp-health-check[0].id]
  region        = local.default_region2

  /*  backend {
    group = google_compute_instance_group.us-ig1[count.index]
  }

  backend {
    group = google_compute_instance_group.us-ig2[count.index]
  }*/
}

resource "google_compute_forwarding_rule" "my-int-lb-forwarding-rule" {
  count                 = local.interconnect-firewall ? 1 : 0
  name                  = "my-int-lb-forwarding-rule"
  region                = local.default_region2
  load_balancing_scheme = "INTERNAL"
  ports                 = ["80"]
  project               = local.interconnect_no_trust_project_id
  network               = google_compute_network.trust[count.index].id

  subnetwork      = google_compute_subnetwork.trust-sub[count.index].id
  backend_service = google_compute_region_backend_service.my-int-lb[count.index].id
}
