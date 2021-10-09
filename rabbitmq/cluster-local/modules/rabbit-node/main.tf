terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_container" "rabbitmq_container" {
  name  = var.name
  hostname = var.name
  image = var.image
  env = ["RABBITMQ_DEFAULT_USER=${local.user}", "RABBITMQ_DEFAULT_PASS=${local.password}", "RABBITMQ_CONFIG_FILE=${local.config_file}", "RABBITMQ_ERLANG_COOKIE=${local.erlang_cookie}"]
  networks_advanced {
    name = var.network
  }
  ports {
    internal = local.management_port
    external = var.management_port
  }
  ports {
    internal = local.queue_port
    external = var.queue_port
  }
  volumes {
    host_path = var.config_host_path
    container_path = "/config/"
  }
}