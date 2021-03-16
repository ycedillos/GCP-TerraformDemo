# Defining networking resources
resource "google_compute_network" "tableau_network" {
  name                    = "tableau-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "tableau_subnet" {
  name          = "tableau-subnet"
  ip_cidr_range = var.network_cidr
  region        = var.region
  network       = google_compute_network.tableau_network.self_link
}