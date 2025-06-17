variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "136.10.0.0/16"
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "my-cluster"    
  
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["136.10.1.0/24", "136.10.2.0/24"]

}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["136.10.3.0/24", "136.10.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones to use for the subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  
}

