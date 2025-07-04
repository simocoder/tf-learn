resource "aws_iam_role" "ec2_role" {
  name = "ec2_s3_access_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "EC2S3AccessPolicy"
  description = "Policy for EC2 to access S3"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = [
        "s3:ListBucket",
        "s3:GetObject",
        "s3:PutObject"
      ]
      Effect   = "Allow"
      Resource = [
        aws_s3_bucket.practice_bucket.arn,
        "${aws_s3_bucket.practice_bucket.arn}/*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_s3_profile"
  role = aws_iam_role.ec2_role.name
}
