output "bucket_name" {
  description = "Name of the created GCS bucket. Null when the bucket is disabled via var.enable_bucket=false."
  value       = try(google_storage_bucket.sandbox[0].name, null)
}

output "bucket_url" {
  description = "URL of the created GCS bucket. Null when the bucket is disabled via var.enable_bucket=false."
  value       = try(google_storage_bucket.sandbox[0].url, null)
}
