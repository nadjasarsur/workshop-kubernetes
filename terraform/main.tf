provider "google" {
  project      = "techops-infradel"
  region       = "europe-west1"
}

resource "google_container_cluster" "primary" {
  name               = "workshop-kubernetes-staffing"
  zone               = "europe-west1-c"
  initial_node_count = 1

  additional_zones = [
    "europe-west1-d",
  ]

  node_config {
    machine_type = "n1-standard-2"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
