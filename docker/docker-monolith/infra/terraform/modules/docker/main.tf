resource "google_compute_instance" "docker" {
  name         = "dockerhost0${count.index+1}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  count        = "${var.count}"

  boot_disk {
    initialize_params {
      image = "${var.docker_disk_image}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  tags = ["docker"]

  network_interface {
    network = "default"
    access_config {}
  }
}
