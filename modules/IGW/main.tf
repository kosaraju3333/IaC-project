#### Creating Internet Gateway ####

resource "aws_internet_gateway" "portal-vpc-igw" {
    vpc_id = var.portal-vpc-id

    tags = {
        Name = var.portal-vpc-igw-name
        Owner = var.owner
    }
}