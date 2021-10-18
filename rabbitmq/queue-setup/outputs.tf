output "queue" {
  value = module.zamo_queue.queue
}

output "exchange" {
  value = module.zamo_queue.exchange
}

output "routing_key" {
  value = module.zamo_queue.routing_key
}