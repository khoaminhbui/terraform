terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}


provider "docker" {}

resource "docker_network" "rabbitmq_network" {
  name = "rabbits"
}

resource "docker_image" "rabbitmq_image" {
  name = "rabbitmq:3-management"
}

resource "docker_container" "rabbitmq_container_1" {
  name  = "rabbit-1"
  hostname = "rabbit-1"
  image = docker_image.rabbitmq_image.latest
  env = ["RABBITMQ_DEFAULT_USER=user", "RABBITMQ_DEFAULT_PASS=1", "RABBITMQ_CONFIG_FILE=/config/rabbitmq", "RABBITMQ_ERLANG_COOKIE=WIWVHCDTCIUAWANLMQAW"]
  networks = [ docker_network.rabbitmq_network.name]
  ports {
    internal = 15672
    external = 8081
  }
  volumes {
    host_path = "${path.cwd}/config/rabbit-1"
    container_path = "/config/"
  }
}

resource "docker_container" "rabbitmq_container_2" {
  name  = "rabbit-2"
  hostname = "rabbit-2"
  image = docker_image.rabbitmq_image.latest
  env = ["RABBITMQ_DEFAULT_USER=user", "RABBITMQ_DEFAULT_PASS=1", "RABBITMQ_CONFIG_FILE=/config/rabbitmq", "RABBITMQ_ERLANG_COOKIE=WIWVHCDTCIUAWANLMQAW"]
  networks = [ docker_network.rabbitmq_network.name]
  ports {
    internal = 15672
    external = 8082
  }
  volumes {
    host_path = "${path.cwd}/config/rabbit-2"
    container_path = "/config/"
  }
}

resource "docker_container" "rabbitmq_container_3" {
  name  = "rabbit-3"
  hostname = "rabbit-3"
  image = docker_image.rabbitmq_image.latest
  env = ["RABBITMQ_DEFAULT_USER=user", "RABBITMQ_DEFAULT_PASS=1", "RABBITMQ_CONFIG_FILE=/config/rabbitmq", "RABBITMQ_ERLANG_COOKIE=WIWVHCDTCIUAWANLMQAW"]
  networks = [ docker_network.rabbitmq_network.name]
  ports {
    internal = 15672
    external = 8083
  }
  volumes {
    host_path = "${path.cwd}/config/rabbit-3"
    container_path = "/config/"
  }
}