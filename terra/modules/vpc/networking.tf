resource "google_compute_network" "vpc-network" {
  
  name                    = "${var.name}-vpc"
  auto_create_subnetworks = false
 
}


resource "google_compute_subnetwork" "subnet" {
  name          = "${var.name}-subnet"
  ip_cidr_range = "${var.subnet_cidr}"
  region        = "${var.region}"
  network       = "${var.name}-vpc"
  depends_on    = ["google_compute_network.vpc-network"]
}



resource "google_compute_firewall" "firewall" {
  name    = "kk-firewall"
  network = google_compute_network.vpc-network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

output "network" {
    value = "${google_compute_network.vpc-network.name}"
}








