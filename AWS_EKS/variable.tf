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






