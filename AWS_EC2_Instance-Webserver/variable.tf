variable "type_instance" {
    default = "t3.medium"
  
}

variable "type_ami" {
    default = "ami-0d8b1aea127330f03"  # RHEL 8.4 AMI in us-east-1
  
}

variable "instance_volume_size" {
    default = 100
  
}

variable "instance_volume_type" {
    default = "gp2"

}