resource "google_compute_subnetwork" "dev-subnet" {
  name          = "cicd-dev-subnet"
  ip_cidr_range = var.dev-subnet-range
  region        = var.region
  network       = var.vpc-name
  private_ip_google_access = true

secondary_ip_range = [
    {
      range_name = "container-subnet-range"
      ip_cidr_range = var.container-subnet-range
    },
    {
      range_name = "service-subnet-range"
      ip_cidr_range = var.service-subnet-range
    }
  ]

}
