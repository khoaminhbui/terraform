locals {
  rabbitmq_vhost = "panu"
  rabbitmq_user = "user"
  rabbitmq_password = "1"
  rabbitmq_queue = "keycloak_event"
}

variable "rabbit_host" {
  default = "http://127.0.0.1"
  description = "Host of rabbit"
}

variable "rabbit_port" {
  description = "Post of rabbit"
}