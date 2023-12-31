terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

locals {
  ip_with_cidr = format("%s/24", var.ip_address)
}

resource "proxmox_lxc" "basic" {

  tags            = var.tags
  swap            = 0
  start           = true
  onboot          = true
  hostname        = var.hostname
  password        = var.lxcpwd
  ostemplate      = "${var.container_template_storage}:vztmpl/${var.container_template}"
  target_node     = var.target_node
  unprivileged    = var.unprivileged
  ssh_public_keys = var.ssh_pub_key


  // Terraform will crash without rootfs defined
  rootfs {
    // By default, LXC containers can't utilize the `local` storage pool.
    // Allow LXC containers to use the 'local' storage pool on Proxmox by running this command
    // on the Proxmox node:
    //   pvesm set <pool> --content vztmpl
    //   pvesm set local --content <storageType>
    // For other options with `--content`, refer to "Common Storage Properties":
    //  https://pve.proxmox.com/wiki/Storage
    storage = var.storage_pool
    size    = var.hdd_size
  }

  network {
    name   = var.network_interface
    bridge = var.network_bridge
    ip     = local.ip_with_cidr
    gw     = var.default_gateway
  }


  // Enable the below Proxmox features to run Docker on LXC.
  #   features {
  #     // IMPORTANT! These features will expose the host's syscall, procfs and sysfs to the client.
  #     // Know the implications of enabling these features before proceeding.
  #     // See <keyctl|nesting> in https://pve.proxmox.com/wiki/Linux_Container
  #     keyctl  = true
  #     nesting = true
  #     }

}
