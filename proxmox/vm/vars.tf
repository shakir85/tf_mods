/*
 Input Variables
 Most description text taken from the `telmate/proxmox` docs.
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
  default     = "dhcp"
  description = "The IPv4 address of the network interface. Values can be: a static IPv4 address in CIDR notation (e.g. 10.40.60.83/24), `dhcp` (default if no IP address provided)"
  type        = string
}

variable "mac_address" {
  default     = ""
  description = "Override the randomly generated MAC Address for the VM. Requires the MAC Address be Unicast. Ignore if you're not configuring DHCP static mapping (i.e. private static IPv4) in your gateway"
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
  type        = number
  description = "Disk size in gigabytes"
}

variable "storage_pool" {
  description = "Proxmox storage pool where the VM's disk should be stored"
  type        = string
}

variable "cloud_init_clone" {
  description = "Name of the cloud-init clone available on the Proxmox node"
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
  type        = bool
  description = "Indicate whether to include the VM's drive in backups"
}

variable "enable_guest_agent" {
  type        = number
  description = "Enable Qemu guest agent. Note, you must run the qemu-guest-agent daemon in the guest OS for this to have any effect."
}

variable "network_model" {
  default     = "virtio"
  type        = string
  description = <<EOT
  **Required** - Network Card Model. The virtio model provides the best performance with very low CPU overhead. 
  If your guest does not support this driver, it is usually best to use `e1000`. 
  Options: `e1000`, `e1000-82540em`, `e1000-82544gc`, `e1000-82545em`, `i82551`, 
  `i82557b`, `i82559er`, `ne2k_isa`, `ne2k_pci`, `pcnet`, `rtl8139`, `virtio`, `vmxnet3`
  EOT
}

variable "network_bridge" {
  default     = "vmbr0"
  type        = string
  description = "Bridge to which the network device should be attached. The Proxmox VE standard bridge is called `vmbr0`"
}
