variable "machine_type_val" {}
variable "az_value" {}
variable "project"{
  default = "sbpuja"
}
variable "region" {
  type        = string
  default     = "asia-east1"

}
variable "user" {

}
variable "email"{

}
variable "privatekeypath" {
  default = "~/.ssh/id_rsa"
}
variable "publickeypath" {
  default = "~/.ssh/id_rsa.pub"
}

variable "vm_names" {
  type    = list(any)
  default = ["dev-vm", "stage-vm", "prod-vm"]
}
variable "istest" {}
variable "tags" {
  type    = list(any)
  default = ["firstvm", "secondvm"]
}
variable "gvmtype" {
  type = map(any)
  default = {
    asia-east1-a = "Debian GNU/Linux 10 (buster)"
    asia-east1-b = "Debian GNU/Linux 9 (stretch)"
    asia-east1-c = "centos-7-v20210721"

  }
}
