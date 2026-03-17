provider "google" {
  project = var.project_id
  region  = var.region
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "sandbox" {
  name                        = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"
  location                    = var.region
  force_destroy               = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  labels = {
    managed_by = "oss-iac"
    purpose    = "sandbox-test"
  }
}

