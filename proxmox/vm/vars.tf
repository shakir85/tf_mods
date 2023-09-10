/*  Available values for the following variables:
      cloud_init_template = [debian11-cloud, centos7-cloud, ubuntu-20.04-cloud]
      storage_pool = [local, local-lvm, sda, sdb, sdc, sdd]
    All paths below are relevant to this Terraform module.

    Proxmox expects IP in CIDR notation
    TF local-exec expects IP without CIDR notation
*/
variable "proxmox_host" {
  default     = "10.10.50.20"
  type        = string
  description = "Proxmox host IP address"
}

variable "pvt_key_path" {
  description = "Path to the private SSH key so `local-exec` provisioner can run Ansible playbooks"
  type        = string
}

variable "default_user" {
  default     = "shakir"
  type        = string
  description = "Default user"
}

variable "inventory_path" {
  description = "Ansible inventory file, must be relative to the `root.tf` file"
  type        = string
}

variable "hostname" {
  description = "VM hostname, or the FQDN. It will be recorded in the /etc/hosts file"
  type        = string
}

variable "target_node" {
  default     = "pve"
  description = "Name of Proxmox node where the resource will be provisioned"
  type        = string
}

variable "ip_address" {
  description = "Host IPv4. Must be in CIDR notation, e.g. `10.20.30.99/24`"
  type        = string
}

variable "mac_address" {
  description = "A valid unicast mac address, this is a Pfsense specfic setup"
  type        = string
}

variable "default_gateway" {
  default     = "10.10.50.10"
  description = "Gateway IPv4"
  type        = string
}

variable "cpu_cores" {
  description = "The number of CPU cores per CPU socket to allocate to the VM. Usually 2x socket number"
  type        = number
}

variable "cpu_sockets" {
  description = "The number of CPU sockets to allocate to the VM"
  type        = number
}

variable "memory" {
  type        = string
  description = "The amount of memory to allocate to the VM in Megabytes"
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
  description = "Cloud-init templates available on the Proxmox node"
  type        = string
}

variable "vm_description" {
  type        = string
  description = "VM description"
}

variable "tags" {
  type        = string
  description = "VM tags, space separated"
}

variable "ansible_command" {
  type        = string
  description = "`ansible-playbook` command. Path must be relative to the `root.tf` file"
}

variable "ip_without_cidr" {
  type        = string
  description = "Same IPv4 `ip_address` section but without the CIDR notation. Needed for the `local-exec` block"
}

variable "backup_enabled" {
  type        = number
  description = "Specify whether to include the drive in backups"
}
