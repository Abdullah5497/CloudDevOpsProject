variable "vpc_id"           {}
variable "public_subnet_id" {}
variable "key_name"         {}

resource "aws_security_group" "jenkins" {
  name        = "jenkins-sg"
  description = "Jenkins security group"
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

  tags = { Name = "jenkins-sg" }
}

resource "aws_instance" "jenkins" {
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t3.medium"
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  tags                   = { Name = "jenkins-server" }
}

output "jenkins_public_ip" { value = aws_instance.jenkins.public_ip }
