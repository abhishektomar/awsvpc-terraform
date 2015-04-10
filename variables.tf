variable "project_name" {
  description = "project name"
  default = "example"
}

variable "access_key" { 
  description = "AWS access key"
}

variable "secret_key" { 
  description = "AWS secret access key"
}

variable "region"     { 
  description = "AWS region to host your network"
  default     = "us-west-1" 
}

variable "key_name" {
  description = "SSH Key for instances"
  default = "example"
}

variable "my_ip" {
  description = "For making ssh connection"
  default = ""
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_c" {
  description = "CIDR for public subnet"
  default     = "10.0.0.0/24"
}

variable "public_subnet_cidr_b" {
  description = "CIDR for public subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_c" {
  description = "CIDR for private subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_b" {
  description = "CIDR for private subnet"
  default     = "10.0.3.0/24"
}

/* Ubuntu 14.04 amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-west-1 = "ami-049d8641" 
    us-west-1-nat = "ami-7850793d"
    us-east-1 = "ami-a6b8e7ce"
  }
}
