/*
Requirement:
  - A pre-configured cloud-init template
  - If used as a module, you must declare a provider here + the root.tf (main.tf) module
*/
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

resource "proxmox_vm_qemu" "vm_resource" {

  name        = var.hostname
  desc        = var.vm_description
  target_node = var.target_node
  agent       = var.enable_guest_agent
  onboot      = true

  # Read this doc, and understand its implications, before enabling full_clone:
  # https://pve.proxmox.com/pve-docs/chapter-qm.html#qm_copy_and_clone
  # When this attribute is set to 'false', Proxmox will do linked clones.
  full_clone = false

  os_type   = "cloud-init"
  clone     = var.cloud_init_clone
  cpu       = "host"
  cores     = var.cpu_cores
  sockets   = var.cpu_sockets
  memory    = var.memory
  ipconfig0 = "ip=${var.ip_address},ip6=dhcp,gw=${var.default_gateway}"
  tags      = var.tags

  network {
    bridge  = var.network_bridge
    model   = var.network_model
    macaddr = var.mac_address
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = var.storage_pool
          size    = var.hdd_size
          backup  = var.backup_enabled
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
