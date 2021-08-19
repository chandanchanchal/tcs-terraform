variable "path" { default = "D:/novelvista-devops/terraform/credentilas" }
provider "google" {
  project     = "${var.project}"
  region      = "${var.region}"
  credentials = file("${var.path}/secrets.json")
}