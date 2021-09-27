data "archive_file" "source" {
  type        = "zip"
  source_dir  = "${path.root}/cloud_function/"
  output_path = "${path.root}/cloud_function.zip"
}

resource "google_storage_bucket_object" "zip_object" {
  name   = "source.zip#${data.archive_file.source.output_md5}"
  bucket = var.bucket_name
  source = data.archive_file.source.output_path
}

resource "google_project_service" "cfunctions" {
  project = var.project
  service = "cloudfunctions.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_project_service" "cbuild" {
  project = var.project
  service = "cloudbuild.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_cloudfunctions_function" "function" {
  name                  = var.name
  description           = "${var.name} HTTP Cloud Function"
  trigger_http          = true
  available_memory_mb   = var.available_memory_mb
  source_archive_bucket = var.bucket_name
  source_archive_object = google_storage_bucket_object.zip_object.name
  timeout               = var.timeout
  entry_point           = var.entry_point
  runtime               = var.runtime
}