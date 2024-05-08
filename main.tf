terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "amiable-archive-416215"
  region = "uscentral-1"
  zone = "uscentral-1a"
  credentials = "amiable-archive-416215-dcbe049caec6.json"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "auto-expiring-bucket-21367"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
resource "google_storage_bucket" "bucket" {
  name     = "my-gcp-bucket"
  location = "US"
  project  = "myfirstproject"
  storage_class = "STANDARD"
}
