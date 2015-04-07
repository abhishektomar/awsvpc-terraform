/* This will give you the output of subnet id's */
output "subnet_id_public_c" {
  value = "${aws_subnet.public-c.id}"
}

output "subnet_id_public_b" {
  value = "${aws_subnet.public-b.id}"
}

output "subnet_id_private_b" {
  value = "${aws_subnet.private-b.id}"
}

output "subnet_id_private_c" {
  value = "${aws_subnet.private-c.id}"
}
