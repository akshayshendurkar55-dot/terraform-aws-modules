variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "The vpc_cidr must be a valid IPv4 CIDR block (e.g., 10.0.0.0/16)."
  }
}

variable "vpc_name" {
  description = "Name tag for the VPC and prefix for associated network resources"
  type        = string
  default     = "main-vpc"
}

variable "availability_zones" {
  description = "List of Availability Zones in the region where subnets will be created"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]

  validation {
    condition     = length(var.availability_zones) > 0
    error_message = "At least one availability zone must be specified."
  }
}

variable "public_subnet_cidrs" {
  description = "List of IPv4 CIDR blocks for the public subnets (length must match availability_zones)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

  validation {
    condition     = alltrue([for cidr in var.public_subnet_cidrs : can(cidrnetmask(cidr))])
    error_message = "All elements in public_subnet_cidrs must be valid IPv4 CIDR blocks."
  }

  validation {
    condition     = length(var.public_subnet_cidrs) == length(var.availability_zones)
    error_message = "The number of public_subnet_cidrs must match the number of availability_zones."
  }
}

variable "private_subnet_cidrs" {
  description = "List of IPv4 CIDR blocks for the private subnets (length must match availability_zones)"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]

  validation {
    condition     = alltrue([for cidr in var.private_subnet_cidrs : can(cidrnetmask(cidr))])
    error_message = "All elements in private_subnet_cidrs must be valid IPv4 CIDR blocks."
  }

  validation {
    condition     = length(var.private_subnet_cidrs) == length(var.availability_zones)
    error_message = "The number of private_subnet_cidrs must match the number of availability_zones."
  }
}

variable "enable_dns_hostnames" {
  description = "Indicates whether instances launched in the VPC get public DNS hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Indicates whether DNS resolution is supported for the VPC"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}
