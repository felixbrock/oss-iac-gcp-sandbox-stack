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

