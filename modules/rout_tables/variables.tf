variable "portal-vpc-public-main-RT-name" {
    description = "Name of portal-vpc-public Main RT"
}

variable "portal-vpc-private-main-RT-name" {
    description = "Name of portal-vpc-private RT"
}

variable "owner" {
    description = "Owner for this resource" 
}

variable "portal-vpc-id" {
    type = string
}

variable "portal-IGW-id" {
    type = string
}


# output "public-subnet-1" {
#     value = aws_subnet.portal-vpc-public-subnet-1.id 
# }

# output "public-subnet-2" {
#     value = aws_subnet.portal-vpc-public-subnet-2.id
# }

# output "private-subnet-1" {
#     value = aws_subnet.portal-vpc-private-subnet-1.id
# }

# output "private-subnet-2" {
#     value = aws_subnet.portal-vpc-private-subnet-2
  
# }

