resource "aws_instance" "public" {
  ami                         = "ami-06e46074ae430fba6"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "project_key"
  vpc_security_group_ids      = [aws_security_group.public.id]
  subnet_id                   = aws_subnet.public[1].id
<<<<<<< HEAD
  tags = {
    Name = "${var.env_prefix}-pub"
=======
  
  tags = {
    Name = "${var.env_prefix}-public"
>>>>>>> 31326bf36201431586b0f236e5f32001b6b99d02
  }
}

resource "aws_security_group" "public" {
<<<<<<< HEAD
  name        = "${var.env_prefix}-sec_group"
=======
  name        = "${var.env_prefix}-secgroup"
>>>>>>> 31326bf36201431586b0f236e5f32001b6b99d02
  description = "Allow ssh inbound "
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "ssh from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["108.216.6.65/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_prefix}-public"
  }
}

<<<<<<< HEAD



resource "aws_instance" "private" {
  ami                    = "ami-06e46074ae430fba6"
  instance_type          = "t2.micro"
  key_name               = "project_key"
  vpc_security_group_ids = [aws_security_group.private.id]
  subnet_id              = aws_subnet.private[1].id
=======
resource "aws_instance" "private" {
  ami                         = "ami-06e46074ae430fba6"
  instance_type               = "t2.micro"
  key_name                    = "project_key"
  vpc_security_group_ids      = [aws_security_group.private.id]
  subnet_id                   = aws_subnet.private[1].id
  
>>>>>>> 31326bf36201431586b0f236e5f32001b6b99d02
  tags = {
    Name = "${var.env_prefix}-private"
  }
}

resource "aws_security_group" "private" {
  name        = "${var.env_prefix}-private"
  description = "Allow ssh inbound "
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "ssh from VPC cidr range"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_prefix}-private"
  }
}
