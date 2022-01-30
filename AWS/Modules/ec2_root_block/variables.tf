variable "inst_ami" {
  description = "Instance ami"
  type        = string
}

variable "inst_type" {
  description = "Instance family type"
  type        = string
}

variable "inst_subnet" {
  description = "Instance subnet"
  type        = string
}

variable "security_groups" {
  description = "Security groups"
  type        = list(any)
}

variable "inst_name" {
  description = "Instance name"
  type        = string
}

variable "instance_role" {
  description = "Instance IAM profile"
  type        = string
}

variable "volume_size" {
  description = "setting to customize the root disk"
  type        = number
}


variable "volume_type" {
  description = "setting to customize the root disk"
  type        = string
}

variable "tags_root_disk" {
  description = "setting to customize the root disk"
  type        = map(string)
}
