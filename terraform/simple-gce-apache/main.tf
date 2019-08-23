provider "google" {
  project = "iac-demo-249505"
  region  = "us-central1"
  zone    = "us-central1-a"
}
resource "google_compute_instance" "gce" {
  name         = "terraform-gce"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  // Set the tags
  tags = ["web"]

  // Make sure apache server install in VM
  metadata_startup_script = "sudo apt update; sudo apt install -yq apache2"

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_firewall" "default" {
  name    = "allow-http"
  network = "default"


  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags = ["web"]
}