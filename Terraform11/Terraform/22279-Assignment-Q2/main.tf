resource "google_compute_project_metadata" "default" {
  metadata = {
    "Name"    = "22279-Krishan-Kumar"
    "Email"   = "krishan.kumar@quantiphi.com"
    "Project" = "training-freshers"
  }
}

module "network" {
  source                  = "./modules/network"
  project                 = var.project
  name                    = var.name
  subnet1_region          = var.subnet1_region
  subnet2_region          = var.subnet2_region
  subnet1_cidr_range      = var.subnet1_cidr_range
  subnet2_cidr_range      = var.subnet2_cidr_range
  flow_sampling           = var.flow_sampling
  auto_create_subnetworks = var.auto_create_subnetworks
}

module "compute_instance" {
  source       = "./modules/compute"
  name         = var.name
  machine_type = var.machine_type
  image        = var.image
  size         = var.size
}

