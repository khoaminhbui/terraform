locals {
  rabbit_vhost = "panu"
}

variable "rabbit_queue" {
  description = "Queue to create"
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