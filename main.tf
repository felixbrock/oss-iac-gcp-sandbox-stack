provider "google" {
  project = var.project_id
  region  = var.region
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# The sandbox bucket is gated on `var.enable_bucket` so the demo can simulate
# a destructive change (Scene 7) by flipping a single variable instead of
# deleting the resource block, which would leave dangling references in
# outputs.tf and break OpenTofu's parser before the plan could ever run.
resource "google_storage_bucket" "sandbox" {
  count = var.enable_bucket ? 1 : 0

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
