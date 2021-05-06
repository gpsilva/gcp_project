resource "google_compute_router" "cloud-router" {
  name    = "cloud-router"
  network = var.vpc-name
  region  = var.region

  bgp {
    asn = 64514
  }
}