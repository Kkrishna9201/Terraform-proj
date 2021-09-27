resource "google_compute_disk" "ext_disk" {
  name  = "data-disk-linux2-${var.name}"
  type  = var.disk_type
  zone  = var.zone
  image = var.image
  size  = var.disk_size
}