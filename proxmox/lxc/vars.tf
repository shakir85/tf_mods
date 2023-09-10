variable "proxmox_host" {
  default = "10.10.50.20"
}

variable "container_template" {
  default     = "debian-12-standard_12.0-1_amd64.tar.zst"
  description = <<EOT
    Available LXC templates:
      *  ubuntu-22.04-standard_22.04-1_amd64.tar.gz
      *  alpine-3.18-default_20230607_amd64.tar.xz
      *  debian-12-standard_12.0-1_amd64.tar.zst
    EOT
}

variable "container_name" {

}

variable "hdd_size" {
  description = "HDD size in Gb. For example '8G'"
}

variable "storage_pool" {
  description = "Available pools: [local, local-lvm, sda, sdb, sdc, sdd]"
}

variable "ip_address" {
  description = "IP with CIDR notation. For example 10.20.30.40/24"
}

# Use env var, must export TF_VAR_lxcpwd=<passwordValue>
variable "lxcpwd" {
  type      = string
  sensitive = true
}

variable "description" {
  type    = string
  default = "No description provided."
}

variable "hostname" {
  type = string
}

variable "memory" {
  type        = string
  description = "A number containing the amount of RAM to assign to the container (in MB)"
}

variable "default_gateway" {
  type = string
}

# Use env var, must export TF_VAR_pub_key=<passwordValue>
variable "ssh_pub_key" {
  type      = string
  sensitive = true
}

variable "tags" {
  type    = string
  default = "none"
}

variable "unprivileged" {
  type    = bool
  default = false
}
