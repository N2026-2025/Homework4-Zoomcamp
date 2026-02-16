terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.16.0"
    }
  }
}

# Configuration options for the Google Cloud provider
provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}
# Initcializar terraform options for the Google Cloud provider
#export GOOGLE_CREDENTIALS='/home/gary/terrademo/keys/my-cred.json'
#nesto@TEVENO MINGW64 ~/OneDrive/Documentos/Zoomcamp/terrademo
# echo $GOOGLE_CREDENTIALS
#nesto@TEVENO MINGW64 ~/OneDrive/Documentos/Zoomcamp/terrademo
#$ terraform init 

resource "google_storage_bucket" "demo-bucket" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "demo-dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}

