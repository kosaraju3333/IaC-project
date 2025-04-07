output "public-subnet-1" {
    value = aws_subnet.portal-vpc-public-subnet-1.id 
}

output "public-subnet-2" {
    value = aws_subnet.portal-vpc-public-subnet-2.id
}

output "private-subnet-1" {
    value = aws_subnet.portal-vpc-private-subnet-1.id
}

output "private-subnet-2" {
    value = aws_subnet.portal-vpc-private-subnet-2
  
}