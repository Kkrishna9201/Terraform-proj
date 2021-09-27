resource "google_compute_project_metadata" "default" {
  metadata = {
    "Name"    = "krishan-kumar"
    "Email"   = "krishan.kumar@quantiphi.com"
    "Project" = "training-freshers"
  }
}

module "disk" {
  source    = "./modules/disk"
  name      = var.name
  disk_type = var.disk_type
  zone      = var.zone
  image     = var.image
  disk_size = var.disk_size
}

module "gcs" {
  source              = "./modules/gcs"
  name                = var.name
  location            = var.location
  force_destroy       = var.force_destroy
  bucket_access_level = var.bucket_access_level
}
module "compute_instance" {
  source         = "./modules/compute"
  name           = var.name
  machine_type   = var.machine_type
  image          = var.image
  size           = var.size
  boot_disk_name = var.boot_disk_name
  network        = var.network
  zone           = var.zone
}
