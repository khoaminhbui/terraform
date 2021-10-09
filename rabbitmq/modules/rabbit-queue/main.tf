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
  username = local.rabbitmq_user
  password = local.rabbitmq_password
}

# Create a virtual host & permissions
resource "rabbitmq_vhost" "my_vhost" {
  name = local.rabbitmq_vhost
}

resource "rabbitmq_permissions" "my_permissions" {
  user  = local.rabbitmq_user
  vhost = rabbitmq_vhost.my_vhost.name

  permissions {
    configure = ".*"
    write     = ".*"
    read      = ".*"
  }
}

# Create the queue
resource "rabbitmq_queue" "my_queue" {
  name  = local.rabbitmq_queue
  vhost = rabbitmq_vhost.my_vhost.name

  settings {
    durable     = false
    auto_delete = true
  }
}