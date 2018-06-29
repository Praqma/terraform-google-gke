variable "cluster_username" {
  type        = "string"
  description = "cluster username."
  default     = "admin"
}

variable "cluster_password" {
  type        = "string"
  description = "password for the cluster username."
}

variable "issue_client_certificate" {
  type        = "string"
  description = "whether to generate client certificate or not."
  default     = "true"
}

variable "cluster_name" {
  default     = "test-k8s"
  type        = "string"
  description = "cluster name."
}

variable "cluster_zone" {
  default     = "europe-west1-b"
  type        = "string"
  description = "The zone where the cluster will be created."
}

variable "cluster_network" {
  default     = "default"
  type        = "string"
  description = "The network where the cluster will be created."
}

variable "cluster_subnetwork" {
  default     = "default"
  type        = "string"
  description = "The subnetwork where the cluster will be created."
}

variable "cluster_description" {
  type        = "string"
  description = "description of the cluster and its purpose."
  default     = "Test cluster"
}

variable "cluster_version" {
  type        = "string"
  description = "The k8s version of the cluster master and nodes."
  default     = "1.9.7-gke.3"
}

variable "pod_security_policy" {
  type        = "string"
  description = "If enabled, pods will only be created if they are valid under a PodSecurityPolicy"
  default     = "false"
}

variable "maintenance_start_time" {
  type        = "string"
  description = "The start time for maintenance in GMT. Format is 24H e.g. 00:00. The maintenance window is 4 hours from the start time."
  default     = "00:00"
}

variable "dashboard_disabled" {
  type        = "string"
  description = "Whether Kubernetes dashboard is to be disabled or not."
  default     = "true"
}

variable "remove_default_node_pool" {
  type        = "string"
  description = "Whether to delete the default node pool (contains 1 node) or not."
  default     = "false"
}

# ## node pool 1


# variable "node_pool1_name" {
#   default     = "pool1"
#   type        = "string"
#   description = "The node pool name."
# }


# variable "node_pool1_count" {
#   default     = 2
#   description = "The initial size of the cluster node pool."
# }


# variable "pool1_min_node_count" {
#   default     = 1
#   description = "The minimum number of nodes in the node pool."
# }


# variable "pool1_max_node_count" {
#   default     = 3
#   description = "The maximum number of nodes in the node pool."
# }


# variable "pool1_node_disk_size_gb" {
#   default     = 100
#   description = "The disk size for nodes in the cluster node pool."
# }


# variable "pool1_node_machine_type" {
#   default     = "n1-standard-1"
#   description = "The machine type for nodes in the node pool."
# }


# ## node pool 2


# variable "node_pool2_name" {
#   default     = "pool2"
#   type        = "string"
#   description = "The node pool name."
# }


# variable "node_pool2_count" {
#   default     = 2
#   description = "The initial size of the cluster node pool."
# }


# variable "pool2_min_node_count" {
#   default     = 1
#   description = "The minimum number of nodes in the node pool."
# }


# variable "pool2_max_node_count" {
#   default     = 3
#   description = "The maximum number of nodes in the node pool."
# }


# variable "pool2_node_disk_size_gb" {
#   default     = 100
#   description = "The disk size for nodes in the cluster node pool."
# }


# variable "pool2_node_machine_type" {
#   default     = "n1-standard-1"
#   description = "The machine type for nodes in the node pool."
# }


# ## node pool 3


# variable "node_pool3_name" {
#   default     = "pool1"
#   type        = "string"
#   description = "The node pool name."
# }


# variable "node_pool3_count" {
#   default     = 2
#   description = "The initial size of the cluster node pool."
# }


# variable "pool3_min_node_count" {
#   default     = 1
#   description = "The minimum number of nodes in the node pool."
# }


# variable "pool3_max_node_count" {
#   default     = 3
#   description = "The maximum number of nodes in the node pool."
# }


# variable "pool3_node_disk_size_gb" {
#   default     = 100
#   description = "The disk size for nodes in the cluster node pool."
# }


# variable "pool3_node_machine_type" {
#   default     = "n1-standard-1"
#   description = "The machine type for nodes in the node pool."
# }

