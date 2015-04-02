provider "aws" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  region      = "${var.region}"
}

/* Creating VPC */
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags { 
    Name = "${var.project_name}" 
  }
}

/* Creating Internet Gateway */
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "${var.project_name}" 
  }
}

/* Creating two public subnet in different AZ's */
resource "aws_subnet" "public-c" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr_c}"
  availability_zone = "us-west-1c"
  map_public_ip_on_launch = true
  tags {
    Name = "${concat(\"public-c-\",var.project_name)}"
  }
}

resource "aws_subnet" "public-b" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr_b}"
  availability_zone = "us-west-1b"
  map_public_ip_on_launch = true
  tags {
    Name = "${concat(\"public-b-\",var.project_name)}"
  }
}

/* Creating two private Subnet in different AZ's */
resource "aws_subnet" "private-c" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr_c}"
  availability_zone = "us-west-1c"
  map_public_ip_on_launch = false
  depends_on = ["aws_instance.nat"]
  tags {
    Name = "${concat(\"private-a-\",var.project_name)}"
  }
}

resource "aws_subnet" "private-b" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr_b}"
  availability_zone = "us-west-1b"
  map_public_ip_on_launch = false
  depends_on = ["aws_instance.nat"]
  tags {
    Name = "${concat(\"private-b-\",var.project_name)}"
  }
}

/* Creating Route Table for Public Subnets */
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
  tags {
    Name = "${concat(\"public-route-\",var.project_name)}"
  }
}

/* Creating Route Table for Private Subnets */ 
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.nat.id}"
  }
  tags {
    Name = "${concat(\"private-route-\",var.project_name)}"
  }
}

/* Associating route table with respective subnets */
resource "aws_route_table_association" "public-b" {
  subnet_id = "${aws_subnet.public-b.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public-c" {
  subnet_id = "${aws_subnet.public-c.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private-b" {
  subnet_id = "${aws_subnet.private-b.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private-c" {
  subnet_id = "${aws_subnet.private-c.id}"
  route_table_id = "${aws_route_table.private.id}"
}
