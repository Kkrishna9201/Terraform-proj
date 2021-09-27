resource "google_compute_instance" "vm_instance" {
  name         = "${var.name}-instance"
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["owner", "krishan-22279"]

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.size
    }
  }

  network_interface {
    network    = "${var.name}-vpc"
    subnetwork = "${var.name}-subnet2"
  }

  metadata = {
    "Name"    = "22279-Krishan-Kumar"
    "Email"   = "krishan.kumar@quantiphi.com"
    "Project" = "training-freshers"
  }

  metadata_startup_script = file("/home/krishan_kumar/Terraform11/Terraform/22279-Assignment-Q2/modules/compute/nginx.sh")
}

