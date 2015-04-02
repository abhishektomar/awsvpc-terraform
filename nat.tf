/* Associating a EIP with NAT instance */
resource "aws_eip" "nat" {
  instance = "${aws_instance.nat.id}"
  vpc = true
}

/* Creating a NAT instance */
resource "aws_instance" "nat" {
  ami = "${var.amis.us-west-1-nat}"
  instance_type = "t1.micro"
  subnet_id = "${aws_subnet.public-b.id}"
  security_groups = ["${aws_security_group.nat.id}"]
  key_name = "${var.key_name}"
  source_dest_check = false
  tags = { Name = "${concat(\"nat-\",var.project_name)}" }
  tags = {
    Name = "${concat(\"nat-\",var.project_name)}"
    Role = "nat"
  }
}

/* Security Group Setting for NAT instance */
resource "aws_security_group" "nat" {
  name = "${concat(\"nat-\",var.project_name)}"
  description = "Primary NAT security group"
  vpc_id = "${aws_vpc.default.id}"
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  ingress {
    from_port = 22
    to_port  = 22
    protocol = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  tags { Name = "${concat(\"sg-nat-\",var.project_name)}" }
}
