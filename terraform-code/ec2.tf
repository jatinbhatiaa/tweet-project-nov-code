provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "myec2" {
  ami             = "ami-0fc5d935ebf8bc3bc"
  instance_type   = "t2.micro"
  key_name        = "us-east-1"
  security_groups = ["demo-sg"]


}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "ssh port"


  ingress {
    description = "ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh port"
  }
}