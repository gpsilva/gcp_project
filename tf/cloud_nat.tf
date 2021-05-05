resource "google_compute_router_nat" "vpc-nat-gateway" {
    name                               = "vpc-nat-gateway"
    router                             = google_compute_router.cloud-router.name
    region                             = var.region
    nat_ip_allocate_option             = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

    log_config {
      enable = true
      filter = "ERRORS_ONLY"
    }
}