resource "google_compute_network" "network" {
  name                    = "${var.name}-vpc"
  project                 = var.project
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "subnet_1" {
  name          = "${var.name}-subnet1"
  ip_cidr_range = var.subnet1_cidr_range
  region        = var.subnet1_region
  network       = google_compute_network.network.id

  log_config {
    flow_sampling = var.flow_sampling
  }
}

resource "google_compute_subnetwork" "subnet_2" {
  name          = "${var.name}-subnet2"
  ip_cidr_range = var.subnet2_cidr_range
  region        = var.subnet2_region
  network       = google_compute_network.network.id

  log_config {
    flow_sampling = var.flow_sampling
  }
}

resource "google_compute_router" "router" {
  name    = "${var.name}-router"
  region  = google_compute_subnetwork.subnet_2.region
  network = google_compute_network.network.id
}

resource "google_compute_address" "address" {
  count  = 2
  name   = "nat-manual-ip-${count.index}"
  region = google_compute_subnetwork.subnet_2.region
}

resource "google_compute_router_nat" "nat_manual" {
  name   = "${var.name}-router-nat"
  router = google_compute_router.router.name
  region = google_compute_router.router.region

  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = google_compute_address.address.*.self_link

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.subnet_2.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}