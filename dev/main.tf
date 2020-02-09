terraform
{
 backend "s3"{
   bucket ="terraform-aswath"
   key="terraform.tfstate"
   region="us-east-1"

provider "aws" {
region = "us-east-1"
}

module "my_vpc" {
source ="../modules/VPC"
vpc_cidr ="192.168.0.0/16"
tenancy ="default"
vpc_id="${module.my_vpc.vpc_id}"
subnet_cidr="192.168.1.0/24"
}

module "my_ec2"{
source ="../modules/EC2"
ec2_count =1
ami_id="ami-062f7200baf2fa504"
instance_type="t2.micro"
subnet_id="${module.my_vpc.subnet_id}"
