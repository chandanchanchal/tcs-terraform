# Create the cluster
resource "google_container_cluster" "gke-cluster" {
  name               = "${var.cluster_name}"
  network            = "default"
  location           = "${var.zone}"
  initial_node_count = 3
}
