variable "proxmox_user" {
  type        = string
  description = "Proxmox User Name"
  default     = "packer@pam!<api-tag>"
}
variable "proxmox_pass" {
  type        = string
  description = "Proxmox User Password"
  default     = "packer"
}
variable "proxmox_token" {
  type        = string
  description = "Proxmox API Token"
}

variable "proxmox_url" {
  type        = string
  description = "Proxmox URL"
  default     = "https://pve1.tourde.me:8006/api2/json"
}

variable "node" {
  type        = string
  description = "Node where to build MI"
  default     = "pve1"
}

variable "task_timeout" {
  type        = string
  description = "The timeout for Promox API operations, e.g. clones. Defaults to 1 minute."
  default     = "5m"
}

variable "cloud_init_storage_pool" {
  type        = string
  default     = "lvm_r1_ssd0"
  description = "Name of the Proxmox storage pool to store the Cloud-Init CDROM on"
}

# Build configuration variables

variable "clone_vm" {
  type        = string
  description = "Source VM (template) used as base image"
  default     = "debian12-baseimage"
}

variable "vm_name" {
  type        = string
  description = "Name of VM during creation"
  default     = "packer-build"
}

# Artefact configuration variables

variable "template_name" {
  type        = string
  description = "Resulting name of the template"
}

variable "template_description" {
  type        = string
  description = "Description of the result template"
  default     = ""
}

variable "vm_id" {
  type        = number
  description = "VM ID of the resulting template, used to overwrite existing machine image, must be unique cluster-wide"
}

# Shell vars
variable "shell_provisioner_inline" {
  type        = list(string)
  description = "List of shell command to run before Ansible provisioner"
  default     = [""]
}

# Ansible vars
variable "ssh_username" {
  type        = string
  description = "SSH username used by Ansible to connect to the building artefact"
}

variable "ansible_groups" {
  type        = list(string)
  default     = ["all"]
  description = "List of groups to add to the host"
}

variable "playbook_file" {
  type        = string
  description = "Path of playbook file"
}

variable "inventory_directory" {
  type        = string
  description = "Path of Ansible inventory"
}

variable "ansible_extra_args" {
  type        = list(string)
  description = "Extra arguments to pass to Ansible"
}

variable "ansible_env_vars" {
  type        = list(string)
  description = "Environment vars to pass to Ansible"
}
