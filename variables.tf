variable "vpc_id" {
  description = "The VPC ID"
  type        = string
  default     = "vpc-024b12da0b3042f4a"
}

variable "subnet_ids" {
  description = "List of subnet IDs to use"
  type        = list(string)
  default     = [
    "subnet-03f6f50caa6b5d5eb",
    "subnet-0f47bd6dac5efd422"
  ]
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 (change if needed)
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH"
  type        = string
  default     = "Java_applicationKP"
}
