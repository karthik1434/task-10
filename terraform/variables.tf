variable "app_name" {
  default = "strapi-app-karthik"
}

variable "environment" {
  default = "production"
}

variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "container_port" {
  default = 1337
}

variable "cpu" {
  default = 512
}

variable "memory" {
  default = 1024
}