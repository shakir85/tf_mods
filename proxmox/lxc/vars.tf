
/*
 Input Variables
*/

variable "container_template" {
  type        = string
  description = "LXC container template"
}

variable "hdd_size" {
  type        = string
  description = "Size of the underlying volume. Must end in T, G, M, or K (e.g. '1T', '1G', '1024M' , '1048576K'). Note that this is a read only value"
}

variable "storage_pool" {
  type        = string
  description = "A string containing the volume , directory, or device to be mounted into the container (at the path specified by mountpoint attribute: `mp`). E.g. `local-lvm`, `local-zfs`, `local` etc."
}

variable "ip_address" {
  type        = string
  description = "The IPv4 address of the network interface. Can be a static IPv4 address, 'dhcp', or 'manual'"
}

# Use env var, must export TF_VAR_lxcpwd=<passwordValue>
variable "lxcpwd" {
  type        = string
  sensitive   = true
  description = "Sets the root password inside the container"
}

variable "description" {
  type        = string
  default     = ""
  description = "Sets the container description seen in the Proxmox web interface"
}

variable "hostname" {
  type        = string
  description = "Specifies the host name of the container. You can use FQDN. It is going to be recorded in /etc/hosts"
}

variable "memory" {
  type        = string
  description = "A number containing the amount of RAM to assign to the container (in MB)"
}

variable "default_gateway" {
  type        = string
  description = "The IPv4 address belonging to the network interface's default gateway"
}

# Use env var, must export TF_VAR_ssh_pub_key=<passwordValue>
variable "ssh_pub_key" {
  type        = string
  sensitive   = true
  description = "Multi-line string of SSH public keys that will be added to the container. Can be defined using heredoc syntax."
}

variable "tags" {
  type        = string
  default     = ""
  description = "Tags for the container. This is only meta information."
}

variable "unprivileged" {
  type        = bool
  default     = false
  description = "A boolean that makes the container run as an unprivileged user. Default is false."
}
