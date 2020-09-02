variable "instance_ami_id" {
  type    = "string"
  default = "ami-02354e95b39ca8dec"
}
variable "instance_type" {
  type    = "string"
  default = "t2.medium"
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


variable "ec2_ingress_cidr" {
  type    = "list"
  default = ["172.31.79.92/32"]
}




