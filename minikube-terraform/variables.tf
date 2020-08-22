variable "instance_ami_id" {
  type    = "string"
  default = "ami-0cc293023f983ed53"
}
variable "instance_type" {
  type    = "string"
  default = "t3.large"
}

variable "instance_tags" {
  type    = "map"
  default = {}
}

variable "instance_vpc_id" {
  type    = "string"
  default = "vpc-f526398f"
}

variable "instance_subnet_id" {
  type    = "string"
  default = "subnet-f91402c7"
}

variable "instance_key_name" {
  type    = "string"
  default = "sheetal_nvirginia_new"
}

#variable "aws_profile_name" {
#  type    = "string"
#  default = "onelogin"
#}

#variable "aws_region" {
#  type    = "string"
#  default = "us-east-1"
#}

variable "ec2_ingress_cidr" {
  type    = "list"
  default = ["172.31.59.251/32"]
}




