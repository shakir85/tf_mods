/*
 Input Variables
*/

variable "default_user" {
  type        = string
  description = "Default username"
}

variable "hostname" {
  description = "VM hostname, or the FQDN. It will be recorded in the /etc/hosts file"
  type        = string
}

variable "target_node" {
  description = "Name of the Proxmox node where the VM will be deployed"
  type        = string
}

variable "ip_address" {
  description = "IPv4 static address e.g., 10.20.30.99"
  type        = string
}

variable "mac_address" {
  default     = ""
  description = "Valid unicast MAC address; ignore if you're not configuring DHCP static mapping in your gateway"
  type        = string
}

variable "default_gateway" {
  description = "IPv4 gateway address - router's IP"
  type        = string
}

variable "cpu_cores" {
  description = "Number of CPU cores per CPU socket for VM allocation (typically 2x socket number)"
  type        = number
}

variable "cpu_sockets" {
  description = "Number of CPU sockets allocated to the VM"
  type        = number
}

variable "memory" {
  type        = string
  description = "Amount of memory allocated to the VM in Megabytes"
}

variable "hdd_size" {
  type        = string
  description = "The disk size. Must adhere to the format specified by the regex [GMK], where G stands for Gigabytes, M for Megabytes, and K for Kilobytes, such as 128G"
}

variable "storage_pool" {
  description = "Proxmox storage pool where the VM's disk should be stored"
  type        = string
}

variable "cloud_init_template" {
  description = "Name of the cloud-init template available on the Proxmox node"
  type        = string
}

variable "vm_description" {
  default     = ""
  type        = string
  description = "VM description. You can use heredoc for multiline description"
}

variable "tags" {
  default     = ""
  type        = string
  description = "VM tags, space separated"
}

variable "backup_enabled" {
  type        = number
  description = "Indicate whether to include the VM's drive in backups."
}
