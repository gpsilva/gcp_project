###### VPC Variables #######
resource "google_compute_network" "vpc" {
  name                    = "dev"
  auto_create_subnetworks = "false"
}

output "vpc" {
  value = google_compute_network.vpc.self_link
}