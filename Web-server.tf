resource "aws_instance" "webserver1" {
  ami                    = "ami-085925f297f89fce1"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.webserver-security-group.id]
  subnet_id              = aws_subnet.private-subnet-1.id
  user_data              = var.user_data

  tags = {
    Name = "Web Server"
  }

}

variable "user_data" {
    description = "user_data for EC2 Instances"
  
}

resource "aws_instance" "webserver2" {
  ami                    = "ami-085925f297f89fce1"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.webserver-security-group.id]
  subnet_id              = aws_subnet.private-subnet-2.id
  user_data              = var.user_data
  tags = {
    Name = "Web Server"
  }

}
