provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "app_sg" {
  name        = "app_sg"
  description = "Allow SSH and 8080 access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AppSecurityGroup"
  }
}

resource "aws_instance" "jenkins_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[0]
  key_name      = var.key_name
  security_groups = [aws_security_group.app_sg.id]

  tags = {
    Name = "Jenkins-Server"
  }
}

resource "aws_instance" "java_app_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[1]
  key_name      = var.key_name
  security_groups = [aws_security_group.app_sg.id]

  tags = {
    Name = "Java-App-Server"
  }
}
