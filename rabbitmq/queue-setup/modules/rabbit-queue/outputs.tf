output "queue" {
  value = rabbitmq_queue.my_queue.name
}

output "exchange" {
  value = rabbitmq_exchange.my_exchange.name
}

output "routing_key" {
  value = rabbitmq_binding.my_binding.routing_key
}