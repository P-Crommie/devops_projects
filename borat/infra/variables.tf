variable "ec2_ami" {
  type    = string
  default = "ami-0735c191cf914754d"
}

variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "project" {
  type    = string
  default = "borat"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
}

variable "availability_zones" {
  type    = list(any)
  default = ["us-west-2a", "us-west-2b"]
}

variable "key_name" {
  type    = string
  default = "borat_key"
}


variable "counter" {
  type    = number
  default = 2
}

variable "project_path" {
  type    = string
  default = "/home/crommie/Documents/workspace/projects/ansible/Borat"
}

variable "user_home_directory" {
  description = "Path to the user's home directory"
  default     = "/home/crommie"
}

variable "ssh_allowed_cidr" {
  type    = list(any)
  default = ["154.160.0.0/12"]
}
