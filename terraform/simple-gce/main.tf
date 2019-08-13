provider "google" {
  project = "iac-demo-249505"
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_instance" "gce" {
  name         = "terraform-gce"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}