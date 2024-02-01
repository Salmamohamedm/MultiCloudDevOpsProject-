resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "MyRouteTable"
  }
}
resource "aws_route_table_association" "rt_public" {
  subnet_id      = var.sub_pub
  route_table_id = aws_route_table.main.id
}
