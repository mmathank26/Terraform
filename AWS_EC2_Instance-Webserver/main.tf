# provider "aws" {
#     region = "us-east-1"
#     access_key = "AKIA6ODU2NNVOGHRKTPS"     # Temporary Keys replace before use
#     secret_key = "i2FkJ+h+ugrbyiC2LlrFGKq70jb+r0D3w6dhD22T"
# }


resource "aws_instance" "AWS_Instance_Test" {
    ami = var.type_ami
    instance_type = var.type_instance
    
    tags = {
      name = "RHEL-Instance" 
    }

    root_block_device {
      volume_size = 100
      volume_type = "gp2"
    }

    depends_on = [ 
        aws_key_pair.web-keys,
        aws_security_group.ssh-login
     ]

    key_name = aws_key_pair.web-keys.id

    vpc_security_group_ids = [ aws_security_group.ssh-login.id ]

  
}


resource "aws_key_pair" "web-keys" {
    public_key = file("C:\\Users\\mmathank\\Downloads\\id_rsa_pub")
    # Please use ur public access key and update the file location accordingly
}

resource "aws_security_group" "ssh-login" {
    name = "ssh-login"
    description = "security group to allow ssh login for the resource. It also have two ports open for containers to use 8080 and 8081."

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8081
        to_port = 8081
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

