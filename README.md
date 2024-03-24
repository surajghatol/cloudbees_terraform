### Description of IAAC
 
#### Modules
* VPC, Internet GW, Subnet are part of vpc.tf module
* ALB, EC2, DB instance are part of alb.tf module

### Root Module
* VPC and ALB modules are called from main.tf
* Few variables are part of terraform.tfvars file
