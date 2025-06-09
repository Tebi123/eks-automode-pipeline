variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "172.31.0.0/16"
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.31"
}

variable "tags" {
  description = "Common tags to apply to resources"
  type        = map(string)
  default = {
    Blueprint  = "eks-automode-pipeline"
    GithubRepo = "github.com/aws-ia/terraform-aws-eks-blueprints"
  }
}

variable "azs" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["eu-west-2a"] # Adjust as needed
}

variable "private_subnet_tags" {
  description = "Tags for private subnets"
  type        = map(string)
  default = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}

variable "public_subnet_tags" {
  description = "Tags for public subnets"
  type        = map(string)
  default = {
    "kubernetes.io/role/elb" = "1"
  }
}
