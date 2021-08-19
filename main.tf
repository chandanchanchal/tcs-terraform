resource "google_compute_firewall" "firewall" {
  name    = "forssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["externalssh"]
}
resource "google_compute_firewall" "webserverrule" {
  name    = "forweb"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["webserver"]
}

resource "google_compute_address" "static" {
  name = "vm-public-address"
  project = "${var.project}"
  region =  "${var.region}"
  depends_on = [google_compute_firewall.firewall]
}

resource "google_compute_instance" "test" {
  name         = "devserver"
  machine_type = "n1-standard-1"
  zone         = "${var.az_value}"
  # tags = local.common_tags

  boot_disk {
    initialize_params {
      image = lookup(var.gvmtype, var.az_value)
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
provisioner "remote-exec" {

  connection {
   host = "google_compute_address.static.address"
   type = "ssh"
   user = "${var.user}"
   timeout = "100s"
   private_key = file("${var.privatekeypath}")
  }
  inline = [
    "sudo yum -y install httpd"
    "sudo service httpd start"
  ]
}

depends_on = [google_compute_firewall.firewall , google_compute_firewall.webserverrule]

service_account{
  email = "${var.email}"
  scope = ["compute-ro"]
}

metadata = {

  ssh_keys = "${var.user}:${var.publickeypath}"
}
