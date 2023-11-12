template_name        = "debian12-std"
template_description = "Debian 12 machine image, default Ansible configuration"
vm_id                = 9001
ssh_username         = "debian"

# ISSUE #1
# shell_provisioner_inline = ["sleep 300"]
shell_provisioner_inline = ["while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1; do sleep 5; done;"]
# shell_provisioner_inline = ["while sudo fuser /var/lib/dpkg/lock-frontend ; do sleep 5; done;"]

# Ansible options
ansible_groups      = ["all"]
playbook_file       = "/home/damien/projects/olorin/projects/ansible/playbooks/servers/site.yml"
inventory_directory = "/home/damien/projects/olorin/projects/ansible/inventories"
ansible_extra_args = [
  "--vault-password-file", "/home/damien/projects/olorin/projects/ansible/playbooks/.vault_files/base_vault_pass", "--diff"
]
ansible_env_vars = [
  "ANSIBLE_CONFIG=/home/damien/projects/olorin/projects/ansible/playbooks/ansible.cfg",
]
