provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "docker" {
  source            = "../modules/docker"
  public_key_path   = "${var.public_key_path}"
  private_key_path  = "${var.private_key_path}"
  zone              = "${var.zone}"
  count             = "${var.count}"
  docker_disk_image = "${var.docker_disk_image}"
}

resource "google_compute_firewall" "firewall_docker-host" {
  name    = "allow-docker-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292","22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker"]
}
