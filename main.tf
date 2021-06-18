provider "aws" {
  region  = "ap-southeast-2"
  version = "2.3.0"
}

module "eks_k8s1" {
  source  = "terraform-aws-modules/eks/aws"
  version = "2.3.1"

  cluster_version = "1.12"

  cluster_name = "k8s"
  Vpc_id = "vpc-eks"

  subnets = ["subnet-eks1", "subnet-eks2", "subnet-eks3"]

  cluster_endpoint_private_access = "true"
  cluster_endpoint_public_access  = "true"

  write_kubeconfig      = true
  config_output_path    = "/.kube/"
  manage_aws_auth       = true
  write_aws_auth_config = true

  map_users = [
    {
      user_arn = "arn:aws:iam::12345678901:user/rahul"
      username = "rahul"
      group    = "system:masters"
    },
  ]

  worker_groups = [
    {
      name                 = "workers"
      instance_type        = "m4.large"
      asg_min_size         = 3
      asg_desired_capacity = 3
      asg_max_size         = 3
      root_volume_size     = 100
      root_volume_type     = "gp2"
      ami_id               = "ami-0000000000"
      ebs_optimized     = false
      key_name          = "all"
      enable_monitoring = false
    },
  ]

  tags = {
    Cluster = "k8s"
  }
}