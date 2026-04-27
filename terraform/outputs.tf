# VPC ID - EKS Cluster'ı bu ağa bağlamak için şart
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# Private Subnets - Worker Node'ların (t3.small) yaşayacağı yer
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

# Public Subnets - Load Balancer'ların (ALB) dış dünyaya açılacağı yer
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# NAT Gateway IP - Sistem dışarıya hangi IP ile çıkıyor?
output "nat_public_ips" {
  description = "List of public Elastic IP addresses created for HTTP secondary learning"
  value       = module.vpc.nat_public_ips
}

# AZ'ler - Hangi bölgelerde çalıştığımızın özeti
output "azs" {
  description = "A list of availability zones specified as argument to this module"
  value       = module.vpc.azs
}