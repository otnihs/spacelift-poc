variable "ami_id" {
  type        = string
  description = "ID of the Spacelift AMI"
  default     = "ami-00baf9444fedc7504"
}


variable "disable_container_credentials" {
  type        = bool
  description = <<EOF
  If true, the run container will not be able to access the instance profile
  credentials by talking to the EC2 metadata endpoint. This is done by setting
  the number of hops in IMDSv2 to 1. Since the Docker container goes through an
  extra NAT step, this still allows the launcher to talk to the endpoint, but
  prevents the container from doing so.
  EOF
  default     = false
}

variable "domain_name" {
  type        = string
  description = "Top-level domain name to use for pulling the launcher binary"
  default     = "spacelift.io"
}

variable "ec2_instance_type" {
  type        = string
  description = "EC2 instance type for the workers"
  default     = "t3.micro"
}

variable "enabled_metrics" {
  type        = list(string)
  description = "List of CloudWatch metrics enabled on the ASG"
  default = [
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

variable "min_size" {
  type        = number
  description = "Minimum numbers of workers to spin up"
  default     = 0
}

variable "max_size" {
  type        = number
  description = "Maximum number of workers to spin up"
  default     = 10
}

variable "tags" {
  type = list(object({
    key                 = string
    value               = string
    propagate_at_launch = bool
  }))
  description = "List of tags to set on the resources"
  default     = []
}

variable "volume_encryption" {
  type        = bool
  default     = false
  description = "Whether to encrypt the EBS volume"
}

variable "volume_size" {
  type        = number
  default     = 40
  description = "Size of instance EBS volume"
}



locals {
  namespace = "sp5ft-01FSRVG2ZXHK5KE9BXY5HZ6YY7"
}