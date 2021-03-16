terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.58.0"
    }
  }

  backend "gcs" {
    bucket = "cedilloscorp-data"
    prefix = "terraform/state"
  }
}