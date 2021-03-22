variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "network_cidr" {
  type = string
}

variable "tableau_machine_type" {
  type        = string
  description = "In the form of custom-CPUS-MEM, number of CPUs and memory for custom machine. https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#specifications"
}

variable "tableau_disk_size" {
  type        = number
  description = "The size of the image in gigabytes."
}

#variable "password" {
#  type = string
#  description = "Write your password"
#}