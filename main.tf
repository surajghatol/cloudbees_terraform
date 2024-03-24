provider "aws" {
  region  = var.main_region
}

module "vpc" {
	source = "./modules/vpc"
	vpc_cidr = var.main_vpc_cidr
	pub_sub_az1_cidr = var.main_pub_sub_az1_cidr
	pub_sub_az1 = var.main_pub_sub_az1
	pub_sub_az2_cidr = var.main_pub_sub_az2_cidr
	pub_sub_az2 = var.main_pub_sub_az2
	priv_sub_az2 = var.main_priv_sub_az2
	priv_sub_az1 = var.main_priv_sub_az1
	priv_sub_az1_cidr = var.main_priv_sub_az1_cidr
	priv_sub_az2_cidr = var.main_priv_sub_az2_cidr
}

module "alb"{
	source = "./modules/alb"
	pub_subnet_az1_cb_id = module.vpc.pub_subnet_az1_cb_id
	pub_subnet_az2_cb_id = module.vpc.pub_subnet_az2_cb_id
	priv_subnet_az1_cb_id = module.vpc.priv_subnet_az1_cb_id
	priv_subnet_az2_cb_id = module.vpc.priv_subnet_az2_cb_id
}