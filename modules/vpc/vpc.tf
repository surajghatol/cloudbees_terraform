
resource "aws_vpc" "vpc_cb"{
	cidr_block = var.vpc_cidr
	tags = {
	  Name = "CB_VPC"
	}
}

resource "aws_internet_gateway" "igw_cb"{
	vpc_id = aws_vpc.vpc_cb.id
	tags = {
	  Name = "CB_IGW"
	}
}

resource "aws_subnet" "pub_subnet_az1_cb" {
	vpc_id = aws_vpc.vpc_cb.id
	map_public_ip_on_launch = true
	cidr_block = var.pub_sub_az1_cidr
	availability_zone = var.pub_sub_az1
	tags = {
	  Name = "CB_PUB_SUBNET_AZ1"
	}
}

resource "aws_subnet" "pub_subnet_az2_cb" {
	vpc_id = aws_vpc.vpc_cb.id
	map_public_ip_on_launch = true
	cidr_block = var.pub_sub_az2_cidr
	availability_zone = var.pub_sub_az2
	tags = {
	  Name = "CB_PUB_SUBNET_AZ2"
	}
}

resource "aws_subnet" "priv_subnet_az1_cb" {
	vpc_id = aws_vpc.vpc_cb.id
	map_public_ip_on_launch = false
	cidr_block = var.priv_sub_az1_cidr
	availability_zone = var.priv_sub_az1
	tags = {
	  Name = "CB_PRIV_SUBNET_AZ1"
	}
}

resource "aws_subnet" "priv_subnet_az2_cb" {
	vpc_id = aws_vpc.vpc_cb.id
	map_public_ip_on_launch = false
	cidr_block = var.priv_sub_az2_cidr
	availability_zone = var.priv_sub_az2
	tags = {
	  Name = "CB_PRIV_SUBNET_AZ2"
	}
}


