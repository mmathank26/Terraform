provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

import {
    to = aws_vpc.main
    id = var.aws_vpc_id

}

resource "aws_vpc" "main" {
    #imported from already defined VPC
}

resource "aws_iam_role" "eks_cluster" {
    name = "${var.cluster_name}-eks-cluster-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
                Service = "eks.amazonaws.com"
            }
        }]
    })
}

 resource "aws_iam_role_policy_attachment" "eks_cluster" {
    role       = aws_iam_role.eks_cluster.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
 }

resource "aws_subnet" "public" {
    count = length(var.subnet_ids)
    vpc_id = var.aws_vpc_id
    cidr_block = var.subnet_ids[count.index]
    availability_zone = element(data.aws_availability_zones.available.names, count.index)

    tags = {
        Name = "${var.cluster_name}-public-subnet-${count.index + 1}"
    }
  
}

resource "aws_eks_cluster" "main" {
    name     = var.cluster_name
    version = var.cluster_version
    role_arn = aws_iam_role.eks_cluster.arn

    vpc_config {
        subnet_ids = aws.subnet.public[*].id
        security_group_ids = var.security_group_ids
    }

    depends_on = [aws_iam_role_policy_attachment.eks_cluster]
  
}


resource "aws_iam_role" "node_group" {
    name = "${var.cluster_name}-node-group-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        }]
    })
  
}

resource "aws_iam_group_policy_attachment" "node_policy" {
    for_each = toset([
        "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
        "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    ])

    policy_arm =each.value
    role aws_iam_role.noede_group.name
}







