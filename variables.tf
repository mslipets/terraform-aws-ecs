#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------
variable "depends_on_efs" {
  description = "If attaching EFS, it makes sure that the mount targets are ready"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "The VPC ID that the cluster will be deployed to"
  type        = string
}

variable "subnet_ids" {
  description = "The Subnet IDs"
  type        = list(string)
}

variable "attach_efs" {
  description = "Whether to try and attach an EFS volume to the instances"
  type        = bool
  default     = false
}

variable "efs_sg_ids" {
  description = "The EFS Security Group ID(s)"
  type        = list(string)
  default     = [""]
}

variable "efs_id" {
  description = "The EFS ID - Required if attach_efs is true"
  type        = string
  default     = ""
}

variable "ecs_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "ecs_cidr_block" {
  description = "ECS Cluster Name"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "ecs_min_size" {
  description = "Minimum number of EC2 instances."
  type        = number
  default     = 1
}

variable "ecs_max_size" {
  description = "Maximum number of EC2 instances."
  type        = number
  default     = 1
}

variable "ecs_desired_capacity" {
  description = "Desired number of EC2 instances."
  type        = number
  default     = 1
}

variable "ecs_instance_type" {
  description = "Default instance type"
  type        = string
  default     = "t3.medium"
}

variable "ecs_key_name" {
  description = "SSH key name in your AWS account for AWS instances."
  type        = string
  default     = ""
}

variable "ecs_associate_public_ip_address" {
  description = "Whether to associate a public IP in the launch configuration"
  type        = bool
  default     = false
}

variable "ecs_additional_iam_statements" {
  description = "Additional IAM statements for the ECS instances"
  type = list(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  default = []
}

variable "ecs_capacity_provider_target" {
  description = "Percentage target of capacity to get to before triggering scaling"
  type        = number
  default     = 90
}

variable "http_proxy" {
  description = "Name of the HTTP proxy on the network"
  type        = string
  default     = ""
}

variable "http_proxy_port" {
  description = "Port number of the HTTP proxy"
  type        = number
  default     = 3128
}

variable "system_controls" {
  description = "A list of node-level sysctls kernel parameters to set on the container instance"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}