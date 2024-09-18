resource "aws_instance" "debian" {
  ami                    = "ami-03e383d33727f4804"
  instance_type          = "t3.micro"
  key_name               = "aws-keypair"
  vpc_security_group_ids = [aws_security_group.debian_sg.id]

  tags = {
    Name = "Debian"
    Environment = "Test"
  }
}

resource "aws_security_group" "debian_sg" {
  name = "debian-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
