locals {
  user = "user"
  password = "1"
  config_file = "/config/rabbitmq"
  erlang_cookie = "WIWVHCDTCIUAWANLMQAW"
  management_port = 15672
}

variable "name" {
  description = "Name of the rabbitmq node in the cluster. Must be unique."
  type = string
}

variable "image" {
  description = "RabbitMQ image"
}

variable "network" {
  description = "Common docker network for all rabbitmq nodes"
  type = string
}

variable "management_port" {
  description = "External management port"
  type = string
}

variable "config_host_path" {
  description = ""
  type = string
}