#### Creating Public and Private Route Tables and association with public and private subnets 

### Filter us-east-1a subnets
data "aws_subnets" "us-east-1a-subnets" {
    filter {
      name = "availability-zone"
      values = ["us-east-1a"]
    }

    filter {
      name = "vpc-id"
      values = [var.portal-vpc-id]
    }
}

### Filter us-east-1b subnets
data "aws_subnets" "us-east-1b-subnets" {
    filter {
      name = "availability-zone"
      values = ["us-east-1b"]
    }

    filter {
      name = "vpc-id"
      values = [var.portal-vpc-id]
    }
}


### Create Public Route Table
resource "aws_route_table" "portal-vpc-main-public-RT" {
    vpc_id = var.portal-vpc-id

    ### Creating Route to Public RT or Enabled Internet access to Public RT
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.portal-IGW-id
    }

    tags = {
      Name = var.portal-vpc-public-main-RT-name
      Owner = var.owner
    }
}

# output "output_subnets_us-east-1a" {
#   value = data.aws_subnets.us-east-1a-subnets.ids
# }

#### Public Subnets association to Route Table
resource "aws_route_table_association" "portal-vpc-public-subnet-1-RT-association" {
    subnet_id = data.aws_subnets.us-east-1a-subnets.ids[0]
    route_table_id = aws_route_table.portal-vpc-main-public-RT.id
}

resource "aws_route_table_association" "portal-vpc-public-subnet-2-RT-association" {
    subnet_id = data.aws_subnets.us-east-1b-subnets.ids[1]
    route_table_id = aws_route_table.portal-vpc-main-public-RT.id
}


#### Creating Private Route Table and association with private subnets 

resource "aws_route_table" "portal-vpc-main-private-RT" {
    vpc_id = var.portal-vpc-id

    ### Creating Route to Private RT or Enabled Internet access to Public RT Via NAT Gateway
    # route {
    #     cidr_block = "0.0.0.0/0"
    #     gateway_id = aws_nat_gateway.portal-vpc-nat.id
    # }

    tags = {
      Name = var.portal-vpc-private-main-RT-name
      Owner = var.owner
    }
}

#### Private Subnets association to Route Table
resource "aws_route_table_association" "portal-vpc-private-subnet-1-RT-association" {
    subnet_id = data.aws_subnets.us-east-1a-subnets.ids[0]
    route_table_id = aws_route_table.portal-vpc-main-private-RT.id
}

resource "aws_route_table_association" "portal-vpc-private-subnet-2-RT-association" {
    subnet_id = data.aws_subnets.us-east-1b-subnets.ids[1]
    route_table_id = aws_route_table.portal-vpc-main-private-RT.id
}



