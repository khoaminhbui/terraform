terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_network" "haproxy_network" {
  name = "ha-network"
}

resource "docker_image" "haproxy_image" {
  name = "haproxy"
}

resource "docker_container" "haproxy_container" {
  name  = "tf-haproxy"
  hostname = "tf-haproxy-host"
  networks_advanced {
    name = docker_network.haproxy_network.name
  }
  image = docker_image.haproxy_image.name
  ports {
    internal = 5670
    external = 5670
  }
  ports {
    internal = 8080
    external = 8080
  }
  ports {
    internal = 8404
    external = 8404
  }
  volumes {
    host_path = "${path.cwd}/config"
    container_path = "/usr/local/etc/haproxy"
    read_only = true
  }
}
