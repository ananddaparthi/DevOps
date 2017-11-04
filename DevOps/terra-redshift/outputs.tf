#gives the output of s3 arn and redshift enpoint
output "s3_bukcet_arn" {
value = "{aws_s3_bucket.bucket.arn}"
}

output "redshift_endpoint" {
  value = "${aws_redshift_cluster.mycluster.endpoint}"
}
