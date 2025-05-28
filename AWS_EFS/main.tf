provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

resource "aws_efs_file_system" "EFS_File_System_ME" {
    creation_token = var.creation_token
    performance_mode = "generalPurpose"

    lifecycle_policy {
        transition_to_ia = var.transition_to_ia
        transition_to_archive = var.transition_to_archive

    }

    tags = {
        Name = "EFS_File_System_ME"
    }

    lifecycle {
      prevent_destroy = true
    }

}

