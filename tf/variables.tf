variable "project_name" {
  description = "GCP project Name"
  default = "devops-teste"
}

variable "project_id" {
  description = "GCP project ID"
  default = "calm-premise-168420"
}

variable "region" { # For Provider, you must specify the region
  description = "GCP region, e.g. us-east1"
  default = "us-central1"
}

variable "location" { # Make the Cluster regional
  description = "GCP location, e.g. us-east1"
  default = "us-central1"
}

## Network Parameters
variable "vpc-name" {
  description = "VPC Name"
  default = "jenkins-cicd"
}

variable "dev-subnet-name" {
  description  = "Dev Subnet Name from Host Project"
  default = "dev-subnet"
}

variable "dev-subnet-range" {
  description  = "Dev Subnet Range"
  default = "10.50.0.0/24" # 256 valid ips
}

variable "container-subnet-range" {
  description  = "Dev Container Subnet Range"
  default = "10.50.8.0/21" # 2046 valid ips
}

variable "service-subnet-range" {
  description  = "Dev Service Subnet Range"
  default = "10.50.16.0/22" # 1022 valid ips
}

## Master Ip Range Parameters
variable "master-dev-subnet-range" {
  description  = "Master Dev Subnet Range"
  default = "10.50.32.0/28" # 15 valid ips
}
