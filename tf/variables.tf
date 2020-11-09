variable "project_name" {
  description = "GCP project Name"
  default = "devops-teste"
}

variable "project_id" {
  description = "GCP project ID"
  default = "devops-teste"
}

variable "region" { # For Provider, you must specify the region
  description = "GCP region, e.g. us-east1"
  default = "us-east1"
}

variable "location" { # To make the Cluster multizone
  description = "GCP location, e.g. us-east1"
  default = "us-east1"
}

## Network Parameters
variable "vpc" { # VPC Name from Infra Project(Host)
  description = "VPC Shared Name from Host Project"
  default = "devops-teste"
}

variable "dev_subnet_name" { # Subnet Name from Infra Project(Host)
  description  = "Dev Subnet Name from Host Project"
  default = "devops-teste"
}

variable "dev-subnet" { # 10.0.1.64/26
  description  = "Dev Subnet Range"
  default = "devops-teste"
}

variable "container-ip-range" { # 10.8.0.0/20
  description  = "Dev Container Subnet Range"
  default = "10.1.0.0/16"
}

variable "service-ip-range" { # 10.12.0.0/20
  description  = "Dev Service Subnet Range"
  default = "10.2.0.0/16"
}

## Master Ip Range Parameters
variable "master-dev-ip-subnet" { # 10.100.0.128/28
  description  = "Master Dev Subnet Range"
  default = "10.3.0.0/28"
}
