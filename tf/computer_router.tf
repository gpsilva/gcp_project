resource "google_compute_router" "cloud-router" {
  name    = "cloud-router"
  network = google_compute_network.vpc.self_link
  region  = var.region

  bgp {
    asn = 64514
  }
}