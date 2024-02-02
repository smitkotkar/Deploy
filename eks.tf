provider "aws" {
  region = "us-east-2"  # Change to your desired region
}

module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  subnets         = ["subnet-0d77d197c6bdb1669", "subnet-096f24687f167fa13", "subnet-0eb8d587e9a4e8051"]  # Update with your subnet IDs
  cluster_version = "1.21"
  vpc_id          = "vpc-0bf146a55b2b621eb"  # Update with your VPC ID

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 1

      instance_type = "t2.micro"   # Update with your desired instance type
    }
  }
}