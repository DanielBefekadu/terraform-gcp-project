terraform {
    backend "gcs" {

        bucket = "tf_bucket_name"
        prefix = "terraform/state"
      }
  required_version = ">=1.0"
  required_providers {
    google= {
        source = "hashicorp/google"
        version = "~> 5.0"
    }
  }
}
provider "google" {
    project = var.project_id
    region = var.region
    zone = var.zone
  
}

module "instance" {

    source = "./modules/instances"
    project_id = var.project_id
    zone = var.zone
    region = var.region
  
  }
module "storage" {
    source = "./modules/storage"
    project_id = var.project_id
    zone = var.zone
    region = var.region
  
}

module "vpc" {
    source = "terraform-google-modules/network/google"
    version = "10.0.0"
    project_id = var.project_id
    network_name = "tf_network_name"
    routing_mode = "global"

    subnets = [
        {
        subnet_name = "subnet_01"
        subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-east4"},
      {
        subnet_name = "subnet_02"
        subnet_ip     = "10.10.20.0/24"
      subnet_region = "us-east4"}
    ]
}


resource "google_compute_firewall" "tf_firewall" {
    name = "tf_firewall"
    project = var.project_id
    network = module.vpc.network_self_link

    allow {
      protocol  = "tcp"
      ports = [80]
    }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}