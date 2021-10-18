# Create queue
module "zamo_queue" {
  source = "./modules/rabbit-queue"
  rabbit_queue = "zamo-queue"
  rabbit_exchange = "zamo-exchange"
  rabbit_routing_key = "zamo-routing-key"
  rabbit_host = "http://127.0.0.1"
  rabbit_port = "8081"
  rabbit_user = "user"
  rabbit_password = "1"
}