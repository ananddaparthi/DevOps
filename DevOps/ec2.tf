provider "aws" {

	access_key = ""
	secret_key = ""
	region = "us-west-2"
}

resource "aws_instance" "nand" {
	ami = "ami-6f68cf0f"
	instance_type = "t2.micro"
	key_name = "mykey"
}