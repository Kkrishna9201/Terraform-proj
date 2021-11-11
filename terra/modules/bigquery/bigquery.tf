resource "google_bigquery_dataset" "dataset" {
  dataset_id    = "terra_dataset"
  friendly_name = "test"
  description   = "This is a test description"
  location      = "EU"


}


resource "google_logging_project_sink" "log_sink" {
  name                   = "terra_log_sink"
  description            = "logsink to bigquery"
  destination            = "bigquery.googleapis.com/projects/qp-qai-devops-2021-06/datasets/${google_bigquery_dataset.dataset.dataset_id}"
  project                = "qp-qai-devops-2021-06"
  unique_writer_identity = true

  filter = "resource.type = gce_instance"

}


