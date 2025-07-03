resource "random_pet" "bucket_suffix" {
  length = 2
}

resource "aws_s3_bucket" "practice_bucket" {
  bucket = "practice-s3-${random_pet.bucket_suffix.id}"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.practice_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
