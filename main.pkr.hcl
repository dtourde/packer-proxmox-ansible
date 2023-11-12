source "proxmox-clone" "created" {
  insecure_skip_tls_verify = true
  proxmox_url              = var.proxmox_url
  node                     = var.node
  username                 = var.proxmox_user
  token                    = var.proxmox_token
  task_timeout             = var.task_timeout

  full_clone    = true
  clone_vm      = var.clone_vm
  vm_name       = format("%s-%s", var.vm_name, var.template_name)
  template_name = var.template_name
  vm_id         = var.vm_id

  cloud_init              = true
  cloud_init_storage_pool = var.cloud_init_storage_pool

  memory = 2048
  cores  = 1
  os     = "l26"

  ssh_username = var.ssh_username
  network_adapters {
    bridge = "vmbr10"
    model  = "virtio"
  }

  scsi_controller = "virtio-scsi-pci"
  qemu_agent      = true
}

build {
  sources = ["source.proxmox-clone.created"]
  provisioner "shell" {
    inline = var.shell_provisioner_inline
  }

  provisioner "ansible" {
    use_proxy = true
    user      = var.ssh_username

    groups              = var.ansible_groups
    playbook_file       = var.playbook_file
    inventory_directory = var.inventory_directory
    extra_arguments     = var.ansible_extra_args
    ansible_env_vars    = var.ansible_env_vars
  }
}
