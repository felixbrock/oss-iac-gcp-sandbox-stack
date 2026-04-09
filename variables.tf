variable "project_id" {
  description = "GCP project ID to deploy into."
  type        = string
  default     = "oss-iac"
}

variable "region" {
  description = "GCP region for regional resources."
  type        = string
  default     = "europe-west3"
}

variable "bucket_prefix" {
  description = "Prefix for the test bucket name."
  type        = string
  default     = "oss-iac-sandbox"
}

variable "enable_bucket" {
  description = "Whether to create the GCS sandbox bucket. Flip to false in Scene 7 of the demo to trigger a destructive plan that the platform-space deny policy should block."
  type        = bool
  default     = true
}
