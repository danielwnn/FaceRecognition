variable "PROJECT_ID" {
  type        = string
  description = "GCP project ID"
}

provider "google" {
  project = var.PROJECT_ID
}

# [START storage_bucket_tf_with_versioning]
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name          = "tfstate-${random_id.bucket_prefix.hex}"
  force_destroy = false
  uniform_bucket_level_access = true
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
# [END storage_bucket_tf_with_versioning]