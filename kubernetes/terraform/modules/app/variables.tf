variable public_key_path {
  description = "Path to the public key used for ssh access"
  type        = string
  default     = "~/.ssh/appuser.pub"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  type        = string
  default     = "reddit-app-base"
}

variable subnet_id {
  description = "Subnets for modules"
  type        = string
}

variable count_app {
  type        = number
  description = "count VMs"
  default     = 1
}

variable app_disk_size {
  type        = number
  description = "Disk size for app"
  default     = 20
}
