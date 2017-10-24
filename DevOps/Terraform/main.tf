#This file spins up a new ec2 Server and Security Group

provider "aws" {

    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

resource "aws_security_group" "projectsg" {
  name        = "projectsg"
  description = "Security group for my project"
  
	tags {
        Name = "ProjectSg"
        }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.30.0.0/16"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.30.0.0/16"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
}

resource "aws_instance" "Projectinstance" {
        ami = "ami-6f68cf0f"
        instance_type ="${var.instance_type}"
        key_name = "${var.key_name}"
        subnet_id = "subnet-296d6371"
        vpc_security_group_ids = ["${aws_security_group.projectsg.id}"]
        tags {
        Name = "ProjectInstance"
        }
		

        
user_data = "${file("apache.sh")}"
user_data = "${file("ssl.sh")}"
user_data = "${file("testconfig.sh")}"
}
