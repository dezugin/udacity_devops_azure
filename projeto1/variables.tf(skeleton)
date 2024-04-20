variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "myResourceGroup"
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
  default     = "East US"
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "Udacity_myResourceGroup"
}

variable "subnet_name" {
  description = "The name of the subnet within the virtual network."
  type        = string
  default     = "Udacity_myResourceGroup"
}

variable "nsg_name" {
  description = "The name of the network security group."
  type        = string
  default     = "Udacity_myResourceGroup"
}

variable "public_ip_name" {
  description = "The name of the public IP address."
  type        = string
  default     = "Udacity_myResourceGroup"
}

variable "nic_name" {
  description = "The name of the network interface."
  type        = string
  default     = "Udacity_myResourceGroup"
}

variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
  default     = "Udacity_myResourceGroup"
}

variable "av_set_name" {
  description = "The name of the availability set."
  type        = string
  default     = "Udacity_myResourceGroup"
}

variable "vm_name_prefix" {
  description = "The prefix for the virtual machine names."
  type        = string
  default     = "umr"
}

variable "vm_count" {
  description = "The number of virtual machines to create."
  type        = number
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "30"
}

variable "vm_image_id" {
  description = "The ID of the custom image deployed with Packer."
  type        = string
  default     = ""
}

# Variables for the load balancer configuration
variable "lb_probe_port" {
  description = "The port used for the load balancer probe."
  default     = 80
}

variable "lb_rule_port" {
  description = "The port used for the load balancer rule."
  default     = 80
}
variable "username" {
  description = "The admin username for the VM being created."
  default = "adminuser"
}

variable "password" {
  description = "The password for the VM being created."
  default = "Password1234!"
}
