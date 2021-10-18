locals {
  rabbit_vhost = "zamo"
}

variable "rabbit_queue" {
  description = "Queue to create"
}

variable "rabbit_exchange" {
}

variable "rabbit_routing_key" {
  
}

variable "rabbit_host" {
  default = "http://127.0.0.1"
  description = "Host of rabbit"
}

variable "rabbit_port" {
  description = "Post of rabbit"
}

variable "rabbit_user" {}

variable "rabbit_password" {}