variable "path" {default = "D:/novelvista-devops/terraform/credentilas"}
provider "google" {
  credentials = "${file("${var.path}/secrets.json")}"
  project     = "genial-theory-323317"
  region      = "us-central1"
}
