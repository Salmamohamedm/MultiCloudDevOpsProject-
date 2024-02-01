//region = "us-east-1"
//cidr-block = "10.0.0.0/16"
//vpc-tag = "my-vpc"
//internet-gateway = "MyInternetGateway"
//public_subnet_cidr_blocks = ["10.0.1.0/24"]
//vpc_cidr_block="10.0.0.0/16"
//cidr-SG= ["0.0.0.0/0"]
//availability_zones = "us-east-1"


//vpc_id   ="0

aws_region  = "us-west-2"
ami_id      = "ami-0123456789abcdef0"
instance_type = "t2.micro"
key_name    = "your-key-pair"
subnet_id   = "subnet-0123456789abcdef0"
instance_name = "ExampleInstance"
region                = "us-west-2"
vpc_cidr              = "10.0.0.0/16"
vpc_name              = "my-vpc"
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
