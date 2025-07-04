output "s3_bucket_name" {
  value = aws_s3_bucket.practice_bucket.id
}

output "ec2_instance_id" {
  value = aws_instance.ec2_example.id
}
