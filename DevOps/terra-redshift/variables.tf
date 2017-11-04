variable "aws_access_key" {
  description = "aws access key"
  default = "********"
  
}
variable "aws_secret_key" {
  description = "aws secret key"
  default = "***********"
  
variable "aws_region" {
  description = "The AWS region to Launch my Instance"
  default     = "us-west-2"
}

variable "cluster_identifier" {
  description = "Redshft cluster identifier"
  default     = "tf-redshift-cluster"
}

variable "database_name" {
  description = "Name of Redshift DB"
  default     = "mydb"
}

variable "master_username" {
  description = "Username for DB"
  default     = "username"
  }

variable "master_password" {
  description = "Password for DB"
  default     = "Password1"
}

variable "node_type" {
  description = "Type of node"
  default     = "dc2.large"
  }  

variable "cluster_type" {
  description = "Type of redshift cluster"
  default     = "multi-node"
}

variable "number_of_nodes" {
  description = "req no. of nodes"
  default     = "2"
}  
   
