variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  type        = string
  default     = "cineindex"
}

variable "project_region" {
  description = "Region to setup the project"
  type        = string
  default     = "eu-west-1"
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

variable "cluster_allowed_cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "argo_helm_version" {
  type    = string
  default = "x.x.x"
}

variable "scaling_config_desired_size" {
  type    = number
  default = 4
}
variable "scaling_config_max_size" {
  type    = number
  default = 5
}

variable "scaling_config_min_size" {
  type    = number
  default = 3
}

variable "max_unavailable_nodes" {
  type    = number
  default = 2
}

variable "ami-type" {
  type    = string
  default = "AL2_x86_64"
}

variable "capacity-type" {
  type    = string
  default = "ON_DEMAND"
}

variable "disk-size" {
  type    = number
  default = 20
}
variable "instance-type" {
  type    = string
  default = "t3a.medium"
}

variable "cluster_version" {
  type    = string
  default = "1.27"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    owner     = "crommie"
    terraform = "true"
    env       = "dev"
  }
}

variable "enable_controlplane_logging" {
  type    = bool
  default = true
}

variable "logs_retention_days" {
  type    = number
  default = 30
}
