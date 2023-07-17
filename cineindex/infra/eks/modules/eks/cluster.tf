# EKS CLuster Definition
resource "aws_eks_cluster" "this" {
  name     = "${var.project}-cluster"
  role_arn = var.cluster_role_arn
  version  = var.cluster_version

  vpc_config {
    security_group_ids      = [var.eks_cluster_sg, var.eks_nodes_sg]
    subnet_ids              = flatten([var.public_subnet_id, var.private_subnet_id])
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = var.cluster_allowed_cidr_blocks
  }

  depends_on = [
    var.AmazonEKSClusterPolicy,
    var.AmazonEKSVPCResourceController,
    aws_cloudwatch_log_group.eks_cluster_logs,
  ]

  enabled_cluster_log_types = var.enable_controlplane_logging ? ["audit", "api", "authenticator", "scheduler", "controllerManager"] : []

}
