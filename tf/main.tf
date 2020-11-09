terraform {
  required_version = ">= 0.12.7"
  backend "gcs" {
    bucket = "devops-teste-infra"
    prefix = "terraform/dev/state"
  }
}