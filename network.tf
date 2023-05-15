# Add internet gateway
resource "aws_internet_gateway" "nakama-igw" {
    vpc_id = "${aws_vpc.nakama-vpc.id}"
    tags = {
        Name = "nakama-igw"
    }
}

# Public routes
resource "aws_route_table" "nakama-public-crt" {
    vpc_id = "${aws_vpc.nakama-vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.nakama-igw.id}" 
    }
    
    tags = {
        Name = "nakama-public-crt"
    }
}
resource "aws_route_table_association" "nakama-crta-public-subnet"{
    subnet_id = "${aws_subnet.nakama-subnet-public.id}"
    route_table_id = "${aws_route_table.nakama-public-crt.id}"
}
