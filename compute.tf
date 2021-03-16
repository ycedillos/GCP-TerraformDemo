#Defining OS image

data "google_compute_image" "ubuntu" {
  family  = "ubuntu-minimal-1804-lts"
#  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
}

resource "google_compute_disk" "tableau_data" {
  name = "tableau-data"
  type = "pd-ssd"
  zone = var.zone
  labels = {
    environment = terraform.workspace
    terraform   = "true"
  }
  size = var.tableau_disk_size
}

resource "google_compute_instance" "tableau" {
  name                      = "tableau"
  allow_stopping_for_update = true
  machine_type              = var.tableau_machine_type
  zone                      = var.zone

  tags = ["allow-external-ssh", "allow-external-http", "allow-external-https"]

  boot_disk {
    auto_delete = true
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  attached_disk {
    source      = google_compute_disk.tableau_data.self_link
    device_name = "datadisk"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.tableau_subnet.self_link
    access_config {

    }
  }

  metadata = {
    "enable-oslogin" = "true"
    user-data = data.template_file.cloud-init.rendered     
#    user-data = file("scripts/configure-drives.yaml")
  }

  service_account {
    scopes = ["monitoring-write", "logging-write", "compute-rw"]
  }

}