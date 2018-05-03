variable "instance_name" {
  description = "use to give name to Instance."
  default     = "cluster"
}
variable "region" {
  default = "RegionOne"
}
variable "image_id" {
  default = "e1189316-8302-4d4c-ae9a-1e43fc95fe42"
}
variable "flavor_id" {
  default = "3"
}
variable "security_group" {
  default = "default"
}
variable "az" {
  default = "base"
}
variable "node_az1" {
  default = "base"
}
variable "node_az2" {
  default = "netronome"
}
variable "network_name" {
  default = "testnetwork"
}
variable "network" {
  default = "bc98ede7-885d-4d47-b7ac-b0867f861a71"
}
variable "ssh_key" {
  default = "/home/ubuntu/.ssh/id_rsa"
}
variable "user" {
  default = "ubuntu"
}
variable "key" {
  default = "need"
}
variable "count" {
  description = "Number of instances/volumes to create."
  default = "1"
}
variable "size" {
  description = "Size of volume to be created in GB."
  default = "20"
}