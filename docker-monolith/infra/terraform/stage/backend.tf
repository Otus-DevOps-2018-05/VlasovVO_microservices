terraform {
  backend "gcs" {
    bucket = "docker-2"
    prefix = "terraform/stage"
  }
}
