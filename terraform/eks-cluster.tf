module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "eks-project-cluster"
  cluster_version = "1.34"
  
  vpc_id     = module.vpc.vpc_id
  
  subnet_ids = module.vpc.public_subnets

  cluster_endpoint_public_access = true
  
  enable_cluster_creator_admin_permissions = true
  
  eks_managed_node_groups = {
    main = {
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2 

      associate_public_ip_address = true
    }
  }

  tags = {
    environment = "demo"
    Project     = "eks-infrastructure"
  }
}