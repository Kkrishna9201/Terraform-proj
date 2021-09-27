variable "project" {
  default = "training-freshers"
}

variable "region" {
  default = "us-east1"
}

#compute
variable "name" {
  default = "krishan-kumar"
}

variable "machine_type" {
  default = "f1-micro"  
}

variable "zone" {
  default = "us-east1-c"
}

variable "image" {
  default = "debian-cloud/debian-9"
}

variable "size" {
  default = "10"
}

variable "network" {
  default = "default"
}

variable "disk_type" {
  default = "pd-ssd"
}

variable "disk_size" {
  default = "50"
}

variable "boot_disk_name" {
  default = "boot_disk_krishan_kumar"
}

variable "location" {
  default = "US"
}
variable "force_destroy" {
  default = true
}
variable "bucket_access_level" {
  default = true
}