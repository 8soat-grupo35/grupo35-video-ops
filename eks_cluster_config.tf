/*resource "aws_eks_access_entry" "eks_access_entry_video_processing" {
  cluster_name      = aws_eks_cluster.eks_cluster_grupo35_video_processing.name
  principal_arn     = "arn:aws:iam::${var.accountIdVoclabs}:role/voclabs"
  kubernetes_groups = ["8soat35"]
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks_policy_grupo35_video_processing" {
  cluster_name  = aws_eks_cluster.eks_cluster_grupo35_video_processing.name
  policy_arn    = var.policyArn
  principal_arn = "arn:aws:iam::${var.accountIdVoclabs}:role/voclabs"

  access_scope {
    type = "cluster"
  }
}

resource "aws_eks_cluster" "eks_cluster_grupo35_video_processing" {
  name = var.projectName
  role_arn = data.aws_iam_role.labrole.arn
  vpc_config {
    subnet_ids = [for id,subnet in data.aws_subnet.subnet : id]
    security_group_ids = [aws_security_group.sg_fastfood_8soat35.id]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}

resource "aws_eks_node_group" "eks_nodeg_grupo35_video_processing" {
  cluster_name    = aws_eks_cluster.eks_cluster_grupo35_video_processing.name
  node_group_name = "NG-${var.projectName}"
  node_role_arn   = data.aws_iam_role.labrole.arn
  subnet_ids      = [for id,subnet in data.aws_subnet.subnet : id]
  disk_size       = 50
  instance_types  = [var.instanceType]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}
*/