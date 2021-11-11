resource "google_compute_instance" "vm" {
  name         = "kk-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

 

 network_interface {

   network = "default"

    access_config {      // Ephemeral public IP
    }
  }

}

