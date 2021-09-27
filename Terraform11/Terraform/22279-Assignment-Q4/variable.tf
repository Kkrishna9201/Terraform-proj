variable "project" {
  default = "training-freshers"
}

variable "region" {
  default = "us-east1"
}

variable "bucket_name" {
  default = "krishan_kumar"
}

variable "object_name" {
  default = "cloud_function.zip"
}

variable "name" {
  default = "krishan-kumar-function"
}

variable "available_memory_mb" {
  default = 128
}

variable "timeout" {
  default = 60
}

variable "entry_point" {
  default = "hello_world"
}

variable "runtime" {
  default = "python37"
}