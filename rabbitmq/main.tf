terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "rabbitmq_image" {
  name = "rabbitmq:3-management"
}

resource "docker_network" "rabbitmq_network" {
  name = local.docker_network
}

module "rabbit_node_1" {
  source = "./modules/rabbitmq-node"
  name = "rabbit-1"
  image = docker_image.rabbitmq_image.latest
  network = local.docker_network
  management_port = 8081
  config_host_path = "${path.cwd}/config/rabbit-1"
}

module "rabbit_node_2" {
  source = "./modules/rabbitmq-node"
  name = "rabbit-2"
  image = docker_image.rabbitmq_image.latest
  network = local.docker_network
  management_port = 8082
  config_host_path = "${path.cwd}/config/rabbit-2"
}

module "rabbit_node_3" {
  source = "./modules/rabbitmq-node"
  name = "rabbit-3"
  image = docker_image.rabbitmq_image.latest
  network = local.docker_network
  management_port = 8083
  config_host_path = "${path.cwd}/config/rabbit-3"
}
