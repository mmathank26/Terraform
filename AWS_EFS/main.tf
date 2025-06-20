provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

resource "aws_security_group" "efs_sg" {
    name        = "efs_sg"
    description = "Security group for EFS mount target"
    vpc_id      = aws_default_vpc.default.id

    ingress {
        from_port   = 2049
        to_port     = 2049
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow NFS traffic"
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }

    tags = {
        Name = "EFS Security Group"
    }
}


resource "aws_efs_file_system" "efs-example" {
    creation_token = var.creation_token
    performance_mode = "generalPurpose"

    lifecycle_policy {
        transition_to_ia = var.transition_to_ia

    }

    tags = {
        Name = "EFS_File_System_ME"
    }

    lifecycle {
      prevent_destroy = true
    }

}

resource "aws_efs_mount_target" "efs-mount" {
    file_system_id = aws_efs_file_system.efs-example.id
    subnet_id      = aws_default_subnet.subnet-1.id
    security_groups = [aws_security_group.efs_sg.id]


}