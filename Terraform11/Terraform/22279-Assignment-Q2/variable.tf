variable "project" {
  default = "training-freshers"
}

variable "region" {
  default = "us-central1"
}

variable "name" {
  default = "krishan-kumar"
}

#network
variable "subnet1_region" {
  default = "us-central1"
}

variable "subnet2_region" {
  default = "us-east1"
}

variable "subnet1_cidr_range" {
  default = "10.200.0.0/24"
}

variable "subnet2_cidr_range" {
  default = "10.200.1.0/24"
}

variable "flow_sampling" {
  default = "0.5"
}

variable "auto_create_subnetworks" {
  default = false
}

#compute
variable "machine_type" {
  default = "f1-micro"
}

variable "image" {
  default = "debian-cloud/debian-9"
}

variable "size" {
  default = "10"
}