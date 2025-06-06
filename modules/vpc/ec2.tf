resource "aws_instance" "ec2-control" {
  ami = "ami-0672b175139a0f8f4" # ubuntu image
  instance_type = "t2.medium"
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_custom.id]
  key_name = "k8s-kp"

  tags = {
    "Name" = "ec2-control"
  }
} 

resource "aws_instance" "ec2-worker1" {
  ami = "ami-0672b175139a0f8f4" # ubuntu image
  instance_type = "t2.medium"
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_custom.id]
  key_name = "k8s-kp"

  tags = {
    "Name" = "ec2-worker1"
  }
}

resource "aws_instance" "ec2-worker2" {
  ami = "ami-0672b175139a0f8f4" # ubuntu image
  instance_type = "t2.medium"
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_custom.id]
  key_name = "k8s-kp"

  tags = {
    "Name" = "ec2-worker2"
  }
}