# Create queue
module "keycloak_event" {
  source = "./modules/rabbit-queue"
  rabbit_queue = "keycloak_event"
  rabbit_host = "http://127.0.0.1"
  rabbit_port = "8081"
  rabbit_user = "user"
  rabbit_password = "1"
}