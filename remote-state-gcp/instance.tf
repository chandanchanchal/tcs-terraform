resource "google_compute_instance" "test"{
  name            = var.instance_name
  machine_type    = var.instance_machine_type
  zone            = var.instance_zone
  boot_disk{
  initialize_params{
    image = var.instance_image
  }
  }
  network_interface {
    network = "default"
  access_config {

  }
  }
  service_account {
    scopes = ["storage-rw"]
  }

  allow_stopping_for_update = true

}

