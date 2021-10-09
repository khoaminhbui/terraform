# Configure the RabbitMQ provider
terraform {
  required_providers {
    rabbitmq = {
      source = "cyrilgdn/rabbitmq"
    }
  }
}

provider "rabbitmq" {
  endpoint = "http://127.0.0.1:8081"
  username = local.rabbitmq_user
  password = local.rabbitmq_password
}

# Create a virtual host & permissions
resource "rabbitmq_vhost" "my_vhost" {
  name = local.rabbitmq_vhost
}

resource "rabbitmq_permissions" "my_permissions" {
  user  = local.rabbitmq_user
  vhost = local.rabbitmq_vhost

  permissions {
    configure = ".*"
    write     = ".*"
    read      = ".*"
  }
}

# Create the queue
resource "rabbitmq_queue" "my_queue" {
  name  = local.rabbitmq_queue
  vhost = local.rabbitmq_vhost

  settings {
    durable     = false
    auto_delete = true
  }
}