resource "aws_vpc" "nakama-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"

    tags = {
        Name = "nakama-vpc"
    }
}

resource "aws_subnet" "nakama-subnet-public" {
    vpc_id = "${aws_vpc.nakama-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.AWS_REGION}a"
    tags = {
        Name = "nakama-subnet-public"
    }
}