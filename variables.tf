variable "environment_name" {
  type        = string
  description = "Set environment name"
  default     = ""
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = ""
}

variable "availability_zone" {
  type        = list(string)
  description = "Availability Zone"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidr_az_a" {
  type        = list(string)
  description = "Public subnet CIDR within AZ-a"
  default     = []
}

variable "public_subnet_cidr_az_b" {
  type        = list(string)
  description = "Public subnet CIDR within AZ-b"
  default     = []
}

variable "public_subnet_interfix" {
  type        = string
  description = "Give interfix to public subnet name"
  default     = "public"
}

variable "additional_tags" {
  type        = map(string)
  description = "Variable for additional tags"
  default     = {}
}

variable "default_route" {
  type        = string
  description = "Default Route from and to the Internet"
  default     = "0.0.0.0/0"
}