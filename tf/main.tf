terraform {
  required_version = ">= 0.12.7"
  backend "gcs" {
    bucket = "eva-terraform"
    prefix = "terraform/dev/state"
  }
}
