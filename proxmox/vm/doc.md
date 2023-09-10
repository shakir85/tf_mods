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
| <a name="input_backup_enabled"></a> [backup\_enabled](#input\_backup\_enabled) | Indicate whether to include the VM's drive in backups. | `number` | n/a | yes |
| <a name="input_cloud_init_template"></a> [cloud\_init\_template](#input\_cloud\_init\_template) | Name of the cloud-init template available on the Proxmox node | `string` | n/a | yes |
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | Number of CPU cores per CPU socket for VM allocation (typically 2x socket number) | `number` | n/a | yes |
| <a name="input_cpu_sockets"></a> [cpu\_sockets](#input\_cpu\_sockets) | Number of CPU sockets allocated to the VM | `number` | n/a | yes |
| <a name="input_default_gateway"></a> [default\_gateway](#input\_default\_gateway) | IPv4 gateway address - router's IP | `string` | n/a | yes |
| <a name="input_default_user"></a> [default\_user](#input\_default\_user) | Default username | `string` | n/a | yes |
| <a name="input_hdd_size"></a> [hdd\_size](#input\_hdd\_size) | The disk size. Must adhere to the format specified by the regex [GMK], where G stands for Gigabytes, M for Megabytes, and K for Kilobytes, such as 128G | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | VM hostname, or the FQDN. It will be recorded in the /etc/hosts file | `string` | n/a | yes |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | IPv4 static address e.g., 10.20.30.99 | `string` | n/a | yes |
| <a name="input_mac_address"></a> [mac\_address](#input\_mac\_address) | Valid unicast MAC address; ignore if you're not configuring DHCP static mapping in your gateway | `string` | `""` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Amount of memory allocated to the VM in Megabytes | `string` | n/a | yes |
| <a name="input_storage_pool"></a> [storage\_pool](#input\_storage\_pool) | Proxmox storage pool where the VM's disk should be stored | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | VM tags, space separated | `string` | `""` | no |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | Name of the Proxmox node where the VM will be deployed | `string` | n/a | yes |
| <a name="input_vm_description"></a> [vm\_description](#input\_vm\_description) | VM description. You can use heredoc for multiline description | `string` | `""` | no |

## Outputs

No outputs.
