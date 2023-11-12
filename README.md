# packer-ansible

## Intro

Packer code used to create base image in Proxmox.

It uses my Ansible playbooks repository[^1] to configure the base image (with ssh users, ntp, monitoring agents, ...).

In order to work with Proxmox (and connect to SSH role), the source image must have qemu-agent installed.
Role `proxmox_image_template`[^1] is used for this exact purpose.

## Usage

Use one of the `pkrvars.hcl` files located in `values` folder, and adapt the hardcoded files path to your usage.

```
packer build -force -var-file ./values/debian12-std.pkrvars.hcl -var-file ./secrets.pkrvars.hcl .
```

[^1]: links will be added when repos will be created
