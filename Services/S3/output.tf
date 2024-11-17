output "bucketname" {
  value = "The bucket name is ${aws_s3_bucket.s3.id}"
}

output "bucketarn" {
  value = "The bucket arn is ${aws_s3_bucket.s3.arn}"

}

output "bucketdomainname" {
  value = "The bucket domain name is ${aws_s3_bucket.s3.bucket_domain_name}"

}

output "region" {
  value = "The bucket region is ${aws_s3_bucket.s3.region}"
}
