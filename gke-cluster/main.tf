resource "google_container_cluster" "primary" {
  name        = "${var.cluster_name}"
  zone        = "${var.cluster_zone}"
  description = "${var.cluster_description}"

  network                  = "${var.cluster_network}"
  subnetwork               = "${var.cluster_subnetwork}"
  min_master_version       = "${var.cluster_version}"
  remove_default_node_pool = "${var.remove_default_node_pool}"
  initial_node_count       = 1

  master_auth {
    username = "${var.cluster_username}"
    password = "${var.cluster_password}"

    client_certificate_config {
      issue_client_certificate = "${var.issue_client_certificate}"
    }
  }

  # The time is specified in 24H format and the time zone is GMT
  # The maintenance window is 4 hours from that time
  maintenance_policy {
    daily_maintenance_window {
      start_time = "${var.maintenance_start_time}" # GMT time
    }
  }

  addons_config {
    kubernetes_dashboard {
      disabled = "${var.dashboard_disabled}"
    }
  }

  # If enabled, pods will only be created if they are valid under a PodSecurityPolicy
  pod_security_policy_config {
    enabled = "${var.pod_security_policy}"
  }
}

# resource "google_container_node_pool" "np1" {
#   name       = "${var.node_pool1_name}"
#   node_count = "${var.node_pool1_count}"
#   zone       = "${var.cluster_zone}"
#   cluster    = "${google_container_cluster.primary.name}"


#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }


#   autoscaling {
#     min_node_count = "${var.pool1_min_node_count}"
#     max_node_count = "${var.pool1_max_node_count}"
#   }


#   node_config {
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/compute",
#       "https://www.googleapis.com/auth/devstorage.read_only",
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring",
#     ]


#     disk_size_gb = "${var.pool1_node_disk_size_gb}"
#     machine_type = "${var.pool1_node_machine_type}"


#     # tags are applied to each cluster node
#     tags = ["dev-cluster-node"]


#     # kubernetes lables (key/value pairs)
#     labels {
#       env  = "dev"
#       pool = "pool1"
#     }
#   }
# }


# resource "google_container_node_pool" "np2" {
#   name       = "${var.node_pool2_name}"
#   node_count = "${var.node_pool2_count}"
#   zone       = "${var.cluster_zone}"
#   cluster    = "${google_container_cluster.primary.name}"


#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }


#   autoscaling {
#     min_node_count = "${var.pool2_min_node_count}"
#     max_node_count = "${var.pool2_max_node_count}"
#   }


#   node_config {
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/compute",
#       "https://www.googleapis.com/auth/devstorage.read_only",
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring",
#     ]


#     disk_size_gb = "${var.pool2_node_disk_size_gb}"
#     machine_type = "${var.pool2_node_machine_type}"


#     # tags are applied to each cluster node
#     tags = ["dev-cluster-node"]


#     # kubernetes lables (key/value pairs)
#     labels {
#       env  = "dev"
#       pool = "pool2"
#     }
#   }
# }


# resource "google_container_node_pool" "np3" {
#   name       = "${var.node_pool3_name}"
#   node_count = "${var.node_pool3_count}"
#   zone       = "${var.cluster_zone}"
#   cluster    = "${google_container_cluster.primary.name}"


#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }


#   autoscaling {
#     min_node_count = "${var.pool3_min_node_count}"
#     max_node_count = "${var.pool3_max_node_count}"
#   }


#   node_config {
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/compute",
#       "https://www.googleapis.com/auth/devstorage.read_only",
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring",
#     ]


#     disk_size_gb = "${var.pool3_node_disk_size_gb}"
#     machine_type = "${var.pool3_node_machine_type}"


#     # tags are applied to each cluster node
#     tags = ["dev-cluster-node"]


#     # kubernetes lables (key/value pairs)
#     labels {
#       env  = "dev"
#       pool = "pool3"
#     }
#   }
# }

