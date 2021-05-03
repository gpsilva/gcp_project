###### GKE Configuration #######
resource "google_container_cluster" "dev-cluster" {
  name = "ci-cd-dev"
  location = var.location
  network = var.vpc-name
  subnetwork = google_compute_subnetwork.dev-subnet.self_link
  resource_labels = {}

  default_max_pods_per_node = "110"
  enable_kubernetes_alpha   = false
  enable_legacy_abac        = false
  initial_node_count        = "1"

  remove_default_node_pool = true

  monitoring_service = "monitoring.googleapis.com/kubernetes"
  logging_service = "logging.googleapis.com/kubernetes"

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "0.0.0.0/0"
      display_name = "Full access"
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "container-subnet-range" # POD IP Range
    services_secondary_range_name = "service-subnet-range" # Service IP Range
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master-dev-subnet-range
  }

  maintenance_policy {
  daily_maintenance_window {
    start_time = "01:00"
  }
}

  addons_config {
    network_policy_config {
      disabled = false
    }

    http_load_balancing {
      disabled = true
    }

    horizontal_pod_autoscaling {
      disabled = true
    }
  }
}

 resource "google_container_node_pool" "dev-node-pool" {
  name = "dev-node-pool"
  location = var.location
  cluster    = google_container_cluster.dev-cluster.name
  initial_node_count = "1"
  max_pods_per_node = "32"

  management {
    auto_repair = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = "1"
    max_node_count = "12"
  }

  node_config {
    preemptible    = true
    disk_size_gb   = "30"
    disk_type      = "pd-standard"
    image_type     = "COS"
    machine_type = "e2-standard-2"
    tags = [
      "dev-node-pool"]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = "dev"
    }
  }
}


