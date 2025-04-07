module "vpc" {
    source = "./modules/vpc"
    vpc-cidr-block = var.vpc-cidr-block
    vpc-name = var.vpc-name
    owner = var.owner
}

module "subnet" {
    source = "./modules/subnets"
    portal-vpc-id = module.vpc.portal-vpc-id
    public-subnet-1-name = var.public-subnet-1-name
    public-subnet-1-cidir = var.public-subnet-1-cidir
    public-subnet-2-name = var.public-subnet-2-name
    public-subnet-2-cidir = var.public-subnet-2-cidir
    private-subnet-1-name = var.private-subnet-1-name
    private-subnet-1-cidir = var.private-subnet-1-cidir
    private-subnet-2-name = var.private-subnet-2-name
    private-subnet-2-cidir = var.private-subnet-2-cidir
    availability-zone-1 = var.availability-zone-1
    availability-zone-2 = var.availability-zone-2
    owner = var.owner
    # depends_on = [module.vpc]
}

module "IGW" {
  source = "./modules/IGW"
  portal-vpc-id = module.vpc.portal-vpc-id
  portal-vpc-igw-name = var.portal-vpc-igw-name
  owner = var.owner
  
}

module "rout_tables" {
  source = "./modules/rout_tables"
  portal-vpc-id = module.vpc.portal-vpc-id
  portal-IGW-id = module.IGW.portal-IGW-id
  portal-vpc-public-main-RT-name = var.portal-vpc-public-main-RT-name
  portal-vpc-private-main-RT-name = var.portal-vpc-private-main-RT-name
  owner = var.owner
  
}


output "output-vpc-id" {
  value = module.vpc.portal-vpc-id
}

# output "output-public-subnert-id" {
#     value = module.subnets.ou
  
# }
