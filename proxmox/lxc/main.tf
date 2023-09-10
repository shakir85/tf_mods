terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_lxc" "basic" {

  tags            = var.tags
  swap            = 0
  start           = true
  onboot          = true
  hostname        = var.container_name
  password        = var.lxcpwd
  ostemplate      = "local:vztmpl/${var.container_template}"
  target_node     = "pve"
  unprivileged    = var.unprivileged
  ssh_public_keys = var.ssh_pub_key


  // Terraform will crash without rootfs defined
  rootfs {
    // To let LXC containers use 'local' pool storage, run this command on the host:
    // pvesm set local --content backup,images,iso,rootdir,snippets,vztmpl
    storage = var.storage_pool
    size    = var.hdd_size
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = var.ip_address
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
