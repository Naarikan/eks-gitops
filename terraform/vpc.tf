module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "eks-main-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  
  enable_nat_gateway = false
  single_nat_gateway = false

  
  map_public_ip_on_launch = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    "kubernetes.io/role/elb"                      = "1"
    "kubernetes.io/cluster/eks-project-cluster"   = "shared"
    "Name"                                        = "eks-public-subnet"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"             = "1"
    "kubernetes.io/cluster/eks-project-cluster"   = "shared"
    "Name"                                        = "eks-private-subnet"
  }

  tags = {
    environment = "demo"
    Project     = "eks-infrastructure"
  }
}


resource "aws_vpc_endpoint" "s3" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.eu-central-1.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = concat(module.vpc.public_route_table_ids, module.vpc.private_route_table_ids)

  tags = {
    Name = "s3-gateway-endpoint"
    Project = "eks-infrastructure"
  }
}