output "efs_arn" {
    description = "The ARN of the EFS file system"
    value       = aws_efs_file_system.EFS_File_System_ME.arn
}

output "efs_dns_name" {
    description = "The DNS name of the EFS file system"
    value       = aws_efs_file_system.EFS_File_System_ME.dns_name
}

output "efs_availability_zone_id" {
    description = "The Availability Zone ID of the EFS mount target"
    value       = aws_efs_file_system.EFS_Mount_Target_ME.availability_zone_id
}

output "aws_efs_mount_target_dns_name" {
    description = "The DNS name of the EFS mount target"
    value       = aws_efs_mount_target.EFS_Mount_Target_ME.dns_name
}   