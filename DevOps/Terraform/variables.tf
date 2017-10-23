variable "aws_access_key" {
  description = "aws access key"
  default = "AKI********"
  }
variable "aws_secret_key" {
  description = "aws secret key"
  default = "bP5C***********"
  }  
variable "aws_region" {
  description = "The AWS region to Launch my Instance"
  default     = "us-west-2"
}

variable "key_name" {
  description = "Name of AWS key pair"
  default     = "AWSkeyName"
}

variable "instance_type" {
  description = "Type of AWS instance"
  default     = "t2.micro"
  }
