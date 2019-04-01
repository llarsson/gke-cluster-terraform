variable "project" {
  type = "string"
  description = "Google Cloud project name"
}

variable "region" {
  type = "string"
  description = "Default Google Cloud region"
}

terraform {
  backend "gcs" {
    bucket = "gke-from-scratch-terraform-state"
    prefix = "terraform"
    credentials = "account.json"
  }
}

provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

