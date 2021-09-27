resource "google_compute_attached_disk" "default" {
  disk     = "data-disk-linux2-${var.name}"
  instance = google_compute_instance.vm_instance.id
}

resource "google_compute_instance" "vm_instance" {
  name         = "linux2-${var.name}"
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["owner", "krishan-kumar"]

  boot_disk {
    auto_delete = true
    device_name = var.boot_disk_name
    initialize_params {
      image = var.image
      size  = var.size
    }
  }

  network_interface {
    network = var.network
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }

  metadata = {
    "Owner"       = "krishan-kumar"
    "Project"     = "training-freshers"
    "Email"       = "krishan.kumar@quantiphi.com"
    "Office-Time" = "24*7"
  }

  metadata_startup_script = "sudo apt-get update -y \n sudo apt full-upgrade -y \n cat \"hello\" > file.txt \n gsutil cp file.txt gs://bucket-krishan-kumar-1/newfile.txt \n gsutil cp gs://bucket-krishan-kumar-1/newfile.txt gs://bucket-krishan-kumar-2/newfile.txt"
}

resource "google_compute_snapshot" "snapshot" {
  name        = "snapshot-${var.name}"
  source_disk = "linux2-${var.name}"
  zone        = var.zone
}

