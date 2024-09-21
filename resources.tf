
/*
resource "aws_instance" "debian" {
  ami                    = "ami-03e383d33727f4804"
  instance_type          = "t3.micro"
  key_name               = "aws-keypair"
  vpc_security_group_ids = [aws_security_group.debian_sg.id]

  tags = {
    Name        = "Debian"
    Environment = "Test"
  }
}

resource "aws_instance" "windows" {
  ami                    = "ami-0845068028e672a07"
  instance_type          = "t3.medium"
  key_name               = "aws-keypair"
  vpc_security_group_ids = [aws_security_group.debian_sg.id]
  tags = {
    Name        = "windows"
    Environment = "Test"
  }
}
*/
resource "aws_instance" "centos" {
  ami                    = "ami-0a7e20852fffed294"
  instance_type          = "t3.micro"
  key_name               = "aws-keypair"
  vpc_security_group_ids = [aws_security_group.debian_sg.id]

  tags = {
    Name        = "Centos"
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
  ingress {
    from_port   = 9990
    to_port     = 9990
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
}
