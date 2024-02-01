resource "aws_security_group" "main" {
  vpc_id = var.vpc_id

  // Ingress rules (allow incoming traffic)
  ingress {
    from_port   = 22   //  Allow SSH traffic
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  // Allow traffic from any IP address
  }

  ingress {
    from_port   = 80   //  Allow HTTP traffic
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  

  // Egress rules (allow outgoing traffic)
  egress {
    from_port   = 0   // Allow all outbound traffic
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  

  tags = {
    Name = "MySecurityGroup"
  }
}

