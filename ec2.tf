resource "aws_instance" "ec2_example" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true
  key_name                    = "July-2025"  # must match the key pair name in AWS
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "TerraformPracticeEC2"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  # vpc_id      = var.vpc_id  # only needed if using custom VPC

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # cidr_blocks = ["0.0.0.0/0"]  # OR restrict to your IP like ["203.0.113.5/32"]
    cidr_blocks = ["${var.MY_PUBLIC_IP}/32"]  # OR restrict to your IP like ["203.0.113.5/32"]
    

  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

