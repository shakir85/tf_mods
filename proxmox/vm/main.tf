/*
Requirement:
  - A pre-configured cloud-init template
  - If used as a module, you must declare a provider here + the root.tf (main.tf) module
*/
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

variable ip_with_cidr {
  format("%s/24", var.ip_address)
}

resource "proxmox_vm_qemu" "vm_resource" {

  name        = var.hostname
  desc        = var.vm_description
  target_node = var.target_node
  agent       = 0
  onboot      = true

  # Read this doc, and understand its implications, before enabling full_clone:
  # https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_copy_and_clone
  # When this attribute is set to 'false', Proxmox will do linked clones.
  # full_clone = false

  os_type   = "cloud-init"
  clone     = var.cloud_init_template
  cpu       = "host"
  cores     = var.cpu_cores
  sockets   = var.cpu_sockets
  memory    = var.memory
  ipconfig0 = "ip=${var.ip_with_cidr},ip6=dhcp,gw=${var.default_gateway}"
  tags      = var.tags

  network {
    bridge  = "vmbr0"
    model   = "virtio"
    macaddr = var.mac_address
  }

  disk {
    type     = "scsi"
    storage  = var.storage_pool
    size     = var.hdd_size
    slot     = 0
    iothread = 0
    backup   = var.backup_enabled
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
