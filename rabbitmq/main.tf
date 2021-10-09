terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

# Create common network & image
resource "docker_image" "rabbitmq_image" {
  name = "rabbitmq:3-management"
}

resource "docker_network" "rabbitmq_network" {
  name = local.docker_network
}

# Create the nodes
module "rabbit_node_1" {
  source = "./modules/rabbit-node"
  name = "rabbit-1"
  image = docker_image.rabbitmq_image.latest
  network = local.docker_network
  management_port = 8081
  queue_port = 5671
  config_host_path = "${path.cwd}/config/rabbit-1"
}

module "rabbit_node_2" {
  source = "./modules/rabbit-node"
  name = "rabbit-2"
  image = docker_image.rabbitmq_image.latest
  network = local.docker_network
  management_port = 8082
  queue_port = 5672
  config_host_path = "${path.cwd}/config/rabbit-2"
}

module "rabbit_node_3" {
  source = "./modules/rabbit-node"
  name = "rabbit-3"
  image = docker_image.rabbitmq_image.latest
  network = local.docker_network
  management_port = 8083
  queue_port = 5673
  config_host_path = "${path.cwd}/config/rabbit-3"
}

# Create queue
module "keycloak_queue" {
  source = "./modules/rabbit-queue"
  rabbit_port = module.rabbit_node_1.management_port
}
