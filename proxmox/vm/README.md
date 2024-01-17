## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.11 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_vm_qemu.vm_resource](https://registry.terraform.io/providers/telmate/proxmox/2.9.11/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_enabled"></a> [backup\_enabled](#input\_backup\_enabled) | Indicate whether to include the VM's drive in backups | `number` | n/a | yes |
| <a name="input_cloud_init_clone"></a> [cloud\_init\_clone](#input\_cloud\_init\_clone) | Name of the cloud-init clone available on the Proxmox node | `string` | n/a | yes |
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | Number of CPU cores per CPU socket for VM allocation (typically 2x socket number) | `number` | n/a | yes |
| <a name="input_cpu_sockets"></a> [cpu\_sockets](#input\_cpu\_sockets) | Number of CPU sockets allocated to the VM | `number` | n/a | yes |
| <a name="input_default_gateway"></a> [default\_gateway](#input\_default\_gateway) | IPv4 gateway address - router's IP | `string` | n/a | yes |
| <a name="input_default_user"></a> [default\_user](#input\_default\_user) | Default username | `string` | n/a | yes |
| <a name="input_hdd_size"></a> [hdd\_size](#input\_hdd\_size) | The disk size. Must adhere to the format specified by the regex [GMK], where G stands for Gigabytes, M for Megabytes, and K for Kilobytes, such as 128G | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | VM hostname, or the FQDN. It will be recorded in the /etc/hosts file | `string` | n/a | yes |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | The IPv4 address of the network interface. Values can be: a static IPv4 address in CIDR notation (e.g. 10.40.60.83/24), `dhcp` (default if no IP address provided) | `string` | `"dhcp"` | no |
| <a name="input_mac_address"></a> [mac\_address](#input\_mac\_address) | Override the randomly generated MAC Address for the VM. Requires the MAC Address be Unicast. Ignore if you're not configuring DHCP static mapping (i.e. private static IPv4) in your gateway | `string` | `""` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Amount of memory allocated to the VM in Megabytes | `string` | n/a | yes |
| <a name="input_network_bridge"></a> [network\_bridge](#input\_network\_bridge) | Bridge to which the network device should be attached. The Proxmox VE standard bridge is called `vmbr0` | `string` | `"vmbr0"` | no |
| <a name="input_network_model"></a> [network\_model](#input\_network\_model) | **Required** - Network Card Model. The virtio model provides the best performance with very low CPU overhead. <br>  If your guest does not support this driver, it is usually best to use `e1000`. <br>  Options: `e1000`, `e1000-82540em`, `e1000-82544gc`, `e1000-82545em`, `i82551`, <br>  `i82557b`, `i82559er`, `ne2k_isa`, `ne2k_pci`, `pcnet`, `rtl8139`, `virtio`, `vmxnet3` | `string` | `"virtio"` | no |
| <a name="input_storage_pool"></a> [storage\_pool](#input\_storage\_pool) | Proxmox storage pool where the VM's disk should be stored | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | VM tags, space separated | `string` | `""` | no |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | Name of the Proxmox node where the VM will be deployed | `string` | n/a | yes |
| <a name="input_vm_description"></a> [vm\_description](#input\_vm\_description) | VM description. You can use heredoc for multiline description | `string` | `""` | no |

## Outputs

No outputs.
