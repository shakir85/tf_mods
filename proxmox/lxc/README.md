## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.11 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_lxc.basic](https://registry.terraform.io/providers/telmate/proxmox/latest/docs/resources/lxc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_template"></a> [container\_template](#input\_container\_template) | LXC container template | `string` | n/a | yes |
| <a name="input_default_gateway"></a> [default\_gateway](#input\_default\_gateway) | The IPv4 address belonging to the network interface's default gateway | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Sets the container description seen in the Proxmox web interface | `string` | `""` | no |
| <a name="input_hdd_size"></a> [hdd\_size](#input\_hdd\_size) | Size of the underlying volume. Must end in T, G, M, or K (e.g. '1T', '1G', '1024M' , '1048576K'). Note that this is a read only value | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Specifies the host name of the container. You can use FQDN. It is going to be recorded in /etc/hosts | `string` | n/a | yes |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | The IPv4 address of the network interface. Can be a static IPv4 address, 'dhcp', or 'manual' | `string` | n/a | yes |
| <a name="input_lxcpwd"></a> [lxcpwd](#input\_lxcpwd) | Sets the root password inside the container | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | A number containing the amount of RAM to assign to the container (in MB) | `string` | n/a | yes |
| <a name="input_ssh_pub_key"></a> [ssh\_pub\_key](#input\_ssh\_pub\_key) | Multi-line string of SSH public keys that will be added to the container. Can be defined using heredoc syntax. | `string` | n/a | yes |
| <a name="input_storage_pool"></a> [storage\_pool](#input\_storage\_pool) | A string containing the volume , directory, or device to be mounted into the container (at the path specified by mountpoint attribute: `mp`). E.g. `local-lvm`, `local-zfs`, `local` etc. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the container. This is only meta information. | `string` | `""` | no |
| <a name="input_unprivileged"></a> [unprivileged](#input\_unprivileged) | A boolean that makes the container run as an unprivileged user. Default is false. | `bool` | `false` | no |

## Outputs

No outputs.
