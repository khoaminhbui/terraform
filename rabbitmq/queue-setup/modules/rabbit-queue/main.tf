# Configure the RabbitMQ provider
terraform {
  required_providers {
    rabbitmq = {
      source = "cyrilgdn/rabbitmq"
    }
  }
}

provider "rabbitmq" {
  endpoint = "${var.rabbit_host}:${var.rabbit_port}"
  username = var.rabbit_user
  password = var.rabbit_password
}

# Create a virtual host & permissions
resource "rabbitmq_vhost" "my_vhost" {
  name = local.rabbit_vhost
}

resource "rabbitmq_permissions" "my_permissions" {
  user  = var.rabbit_user
  vhost = rabbitmq_vhost.my_vhost.name

  permissions {
    configure = ".*"
    write     = ".*"
    read      = ".*"
  }
}

# Create the queue
resource "rabbitmq_queue" "my_queue" {
  name  = var.rabbit_queue
  vhost = rabbitmq_vhost.my_vhost.name

  settings {
    durable     = true
    auto_delete = false
  }
}

# Create the exchange
resource "rabbitmq_exchange" "my_exchange" {
  name  = var.rabbit_exchange
  vhost = rabbitmq_vhost.my_vhost.name

  settings {
    type        = "direct"
    durable     = true
    auto_delete = false
  }
}

# Create the binding
resource "rabbitmq_binding" "my_binding" {
  source           = rabbitmq_exchange.my_exchange.name
  vhost            = rabbitmq_vhost.my_vhost.name
  destination      = rabbitmq_queue.my_queue.name
  destination_type = "queue"
  routing_key      = var.rabbit_routing_key
}