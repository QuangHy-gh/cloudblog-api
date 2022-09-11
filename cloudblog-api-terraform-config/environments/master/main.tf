terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}


provider "google" {
  credentials = file("D:/Credentials/cloudblog-api-3d73316657d4.json")

  project = var.project_id
  region  = "us-central1"
  zone    = "us-central1-c"

}


resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = "us-central"
}

resource "google_app_engine_firewall_rule" "firewall_rule" {
  source_range = var.source_range
  action       = var.action
  description  = var.description
  priority     = var.priority
}

resource "google_project_service" "sqladmin" {
  project            = var.project_id
  service            = var.apis[0]
  disable_on_destroy = false
}

resource "google_project_service" "secretmanager" {
  project            = var.project_id
  service            = var.apis[1]
  disable_on_destroy = false
}

resource "google_project_service" "cloudbuild" {
  project            = var.project_id
  service            = var.apis[2]
  disable_on_destroy = false
}

resource "google_project_service" "cloudstorage" {
  project            = var.project_id
  service            = var.apis[3]
  disable_on_destroy = false
}

resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "api_bucket" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location      = "us-central1"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}


