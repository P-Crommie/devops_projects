resource "aws_iam_role" "ebs_csi_driver_role" {
  name = "${var.project}-EbsCSIDriverRole"

  assume_role_policy = data.aws_iam_policy_document.eksdoc_assume_role_policy.json
  depends_on         = [aws_iam_openid_connect_provider.eksopidc]
}

resource "aws_iam_role_policy_attachment" "AmazonEBSCSIDriverPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.ebs_csi_driver_role.name
  depends_on = [aws_iam_role.ebs_csi_driver_role]
}

resource "aws_eks_addon" "ebs_csi" {
  cluster_name                = aws_eks_cluster.this.name
  addon_name                  = "aws-ebs-csi-driver"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  service_account_role_arn    = aws_iam_role.ebs_csi_driver_role.arn
}
