variable "ami" {
  type        = string
  description = "ami for ec2"
  default     = "ami-06178cf087598769c"
}

variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "m5.large"
}

variable "region" {
  type        = string
  description = "region"
  default     = "eu-west-2"
}