variable "container_name" {
  type = string
  default = "docker-container1"
  description = "NGINX container's name"
}

variable "nginx_port" {
  type = number
  default = 8000
  description = "NGINX container's external port number"
}

variable "secret_key" {
  type = string
  default = "secret-value"
}