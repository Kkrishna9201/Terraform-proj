resource "google_storage_bucket" "bucket1" {
  name          = "bucket-${var.name}-1"
  location      = var.location
  force_destroy = var.force_destroy

  uniform_bucket_level_access = var.bucket_access_level
}

resource "google_storage_bucket" "bucket2" {
  name          = "bucket-${var.name}-2"
  location      = var.location
  force_destroy = var.force_destroy

  uniform_bucket_level_access = var.bucket_access_level
}