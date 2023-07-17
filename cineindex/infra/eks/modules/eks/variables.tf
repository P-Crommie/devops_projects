variable "scaling_config_desired_size" {
  type = number
}

variable "scaling_config_max_size" {
  type = number
}

variable "cluster_version" {
  type = string
}

variable "scaling_config_min_size" {
  type = number
}

variable "max_unavailable_nodes" {
  type = number
}

variable "ami-type" {
  type = string
}

variable "capacity-type" {
  type = string
}

variable "disk-size" {
  type = number
}

variable "instance-type" {
  type = string
}

variable "project" {
  description = "Name of the project deployment."
  type        = string
}

variable "logs_retention_days" {
  type = number
}

variable "enable_controlplane_logging" {
  type = bool
}

variable "cluster_allowed_cidr_blocks" {
  description = "CIDR blocks used to access to the EKS public API"
  type        = list(any)
}

variable "node_role_arn" {
  description = "Node arn"
}

variable "AmazonEKSWorkerNodePolicy" {
  description = "This policy allows Amazon EKS worker nodes to connect to Amazon EKS Clusters"
}

variable "AmazonEC2ContainerRegistryReadOnly" {
  description = "Provides read-only access to Amazon EC2 Container Registry repositories"
}

variable "cluster_role_arn" {}

variable "AmazonEKSClusterPolicy" {}

variable "AmazonEKSVPCResourceController" {}

variable "private_subnet_id" {}

variable "public_subnet_id" {}

variable "AmazonEKS_CNI_Policy" {}

variable "eks_cluster_sg" {}

variable "eks_nodes_sg" {}
