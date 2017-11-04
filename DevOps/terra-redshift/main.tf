#This file deployes a security group, s3 bucket, redshift cluster
provider "aws" {

access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

#Creating Security group
resource "aws_security_group" "projectsg" {
  name        = "projectSG"
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
    from_port   = 4455
    to_port     = 4455
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
}

#Creating S3 Bucket

resource "aws_s3_bucket" "bucket" {
  bucket = "my-sampleterraform-test-bucket"
  acl    = "private"

  tags {
    Name        = "My bucket"
  }
}

#Attaching policy to the above created bucket
resource "aws_s3_bucket_policy" "bucket" {
  bucket = "${aws_s3_bucket.bucket.id}"
  policy =<<POLICY
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "Stmt1376526643067",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::902366379725:user/logs"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::my-sampleterraform-test-bucket/*"
        },
        {
            "Sid": "Stmt137652664067",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::902366379725:user/logs"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::my-sampleterraform-test-bucket"
        }
    ]
}
POLICY
}

#Creating Redshift Cluster
resource "aws_redshift_cluster" "mycluster" {
  cluster_identifier = "${var.cluster_identifier}"
  database_name      = "${var.database_name}"
  master_username    = "${var.master_username}"
  master_password    = "${var.master_password}"
  node_type          = "${var.node_type}"
  cluster_type       = "${var.cluster_type}"
  number_of_nodes    = "${var.number_of_nodes}"
  vpc_security_group_ids = ["${aws_security_group.projectsg.id}"]
  skip_final_snapshot = "true"
  port              =  "4455"
  #iam_roles         = ["redshift-iam"]
  enable_logging    =  "true"
  bucket_name       =  "my-sampleterraform-test-bucket"
  tags {
    Name        = "My RedShiftCluster"
  }
}

