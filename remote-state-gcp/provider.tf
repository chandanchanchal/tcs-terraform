variable "path" { 
    default = "D:/novelvista-devops/terraform/credentilas" 
    }
provider "google" {
  project     = "genial-theory-323317"
  region      = "europe-west2"
  credentials = file("${var.path}/secrets.json")
}