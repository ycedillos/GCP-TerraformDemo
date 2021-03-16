resource "google_compute_firewall" "ssh" {
  name    = "ssh-firewall"
  network = google_compute_network.tableau_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags   = ["allow-external-ssh"]
  source_ranges = ["190.86.96.137/32"]
}

resource "google_compute_firewall" "http" {
  name    = "http-firewall"
  network = google_compute_network.tableau_network.name
  allow {
    protocol = "tcp"
    ports    = ["80", "8850"]
  }
  target_tags   = ["allow-external-http"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "https" {
  name    = "https-firewall"
  network = google_compute_network.tableau_network.name
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags   = ["allow-external-https"]
  source_ranges = ["0.0.0.0/0"]
}