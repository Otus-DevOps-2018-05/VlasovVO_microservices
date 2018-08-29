variable "project" {
  description = "Project ID"
}

variable "region" {
  description = "Region"
  default     = "europe-west1"
}

variable "zone" {
  description = "Zone"
  default     = "europe-west1-b"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "private_key_path" {
  description = "Path to the private key used for provisioner connect"
}

variable "count" {
  description = "Default numbers of VMs"
  default     = 1
}

variable "docker_disk_image" {
  description = "Disk image for docker"
  default     = "ubuntu-1604-lts"
}
