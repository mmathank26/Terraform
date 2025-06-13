variable "aws_region" {
  description = "The AWS region where the EKS cluster will be created."
  type        = string
  default     = "us-east-2"

}

variable "aws_access_key" {
  description = "The AWS access key."
  type        = string
  default     = ""
}

variable "aws_secret_key" {
  description = "The AWS secret key."
  type        = string
  default     = ""
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "The version of the EKS cluster."
  type        = string
  default     = "1.21"
  
}

variable "aws_vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be created."
  type        = string
  default     = "" #update with your VPC ID
  
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the EKS cluster."
  type        = list(string)
  default     = [] #update with your security group IDs
  
}
variable "node_group" {
  description = "EKS node group configuration"
  type = map(object({
    instance_type = string
    desired_capacity = number
    max_size = number
    min_size = number
  }))

  default = {
    "example" = {
      instance_type   = "m3.medium"
      desired_capacity = 2
      max_size        = 3
      min_size        = 1
    }
  }

}


