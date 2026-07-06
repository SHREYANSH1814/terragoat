data "google_compute_zones" "available_zones" {
  project = var.project
  region  = var.region
}

resource "google_container_cluster" "workload_cluster" {
  name               = "terragoat-${var.environment}-cluster"
  logging_service    = "logging.googleapis.com/kubernetes"
  location           = var.region
  initial_node_count = 1

  enable_legacy_abac       = true
  monitoring_service       = "monitoring.googleapis.com/kubernetes"
  remove_default_node_pool = true
  network                  = google_compute_network.vpc.name
  subnetwork               = google_compute_subnetwork.public-subnetwork.name
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "0.0.0.0/0"
    }
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = google_compute_subnetwork.public-subnetwork.secondary_ip_range_names[0]
    services_secondary_range_name = google_compute_subnetwork.public-subnetwork.secondary_ip_range_names[1]
  }
  enable_intranode_visibility = true
}

resource "google_container_node_pool" "custom_node_pool" {
  cluster  = google_container_cluster.workload_cluster.name
  location = var.region

  node_config {
    image_type = "Ubuntu"
  }
}
