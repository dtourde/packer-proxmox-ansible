template_name        = "ubuntu2204-std"
template_description = "Ubuntu 22.04 machine image, default Ansible configuration"
vm_id                = 9003
ssh_username         = "ubuntu"

shell_provisioner_inline = ["sleep 30; while sudo fuser /var/lib/dpkg/lock-frontend ; do sleep 5; done;"]

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
# "ANSIBLE_SSH_ARGS='-oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=ssh-rsa -oIdentitiesOnly=yes'",

# "ANSIBLE_HOST_KEY_CHECKING=False"
