resource "aws_instance" "Ansible-node" {
  count = var.instance_count

  ami           ="ami-0fe630eb857a6ec83" # Change to your desired AMI
  instance_type = "t2.micro"
  key_name      = "my instance"

  vpc_security_group_ids   = [var.security_group_id]
  subnet_id                = var.subnet_id
  //route_table_ids        = [var.route_table_id]

  tags = {
    Name = "EC2_Instance_${count.index + 1}"
  }
}
