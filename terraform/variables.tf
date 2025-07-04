variable "region" {
  default = "ap-southeast-2"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2"
  # default     = "ami-0c55b159cbfafe1f0" # Update based on region
  default     = "ami-0e6874cbf738602e7" # Update based on region
  
}

variable "MY_PUBLIC_IP" {
  type      = string
  sensitive = true
}

