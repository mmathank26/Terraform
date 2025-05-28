
variable "aws_region" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "us-east-1"       
  
}

variable "aws_access_key" {
    description = "AWS access key"
    type        = string
    default     = "AKIA6ODU2NNVOGHRKTPS"  # Temporary Keys replace before use
}

variable "aws_secret_key" {
    description = "AWS secret key"
    type        = string
    default     = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"  # Temporary Keys replace before use
}

variable "creation_token" {
    description = "Unique identifier for the EFS file system"
    type        = string
    default     = "EFS_File_System_ME"
  
}


variable "transition_to_ia" {
    description = "Transition to Infrequent Access storage class"
    type        = string
    default     = "AFTER_1_DAYS"
}

#available options for transition_to_ia:
# Valid values: AFTER_1_DAY, AFTER_7_DAYS, AFTER_14_DAYS, 
# AFTER_30_DAYS, AFTER_60_DAYS, AFTER_90_DAYS, AFTER_180_DAYS, 
# AFTER_270_DAYS, or AFTER_365_DAYS

variable "transition_to_archive" {
    description = "Transition to Archive storage class"
    type        = string
    default     = "AFTER_30_DAYS"
}

#available options for transition_to_archive:
# Valid values: AFTER_1_DAY, AFTER_7_DAYS, AFTER_14_DAYS, 
# AFTER_30_DAYS, AFTER_60_DAYS, AFTER_90_DAYS, AFTER_180_DAYS, 
# AFTER_270_DAYS, or AFTER_365_DAYS
