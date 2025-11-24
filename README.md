Terraform GCP Project: VM, Storage, VPC, and Firewall Setup

This project demonstrates how to use Terraform to deploy and manage resources on Google Cloud Platform (GCP). The project includes creating virtual machines (VMs), a storage bucket, a VPC with subnets, and a firewall rule using Terraform modules.

Modules
Instances Module: Manages Google Compute Engine instances

                Configurable machine type, boot disk, network interface, and startup script
                Supports multiple instances

Storage Module: Creates a Google Cloud Storage bucket

                Configurable bucket name, location, and uniform bucket-level access
                Used as the remote backend for Terraform state

VPC Module :Uses Terraform Registry module terraform-google-modules/network/google (v10.0.0)

            Creates a VPC (tf-vpc-232759) with global routing mode
            Creates 2 subnets  

Cloud Storage Bucket: Configured as Terraform remote backend

Firewall Rule: Allows TCP traffic on port 80 from 0.0.0.0/0

Usage

      Initialize Terraform: terraform init

      Plan changes: terraform plan

      Apply changes: terraform apply

      Destroy resources (optional): terraform destroy

This project demonstrates how to use Terraform to automate the deployment and management of cloud infrastructure on Google Cloud Platform (GCP). It shows how to create virtual machines, storage, networking, and security configurations in a modular and reusable way, using variables for flexibility. The project illustrates best practices in infrastructure-as-code, including automated provisioning, secure configuration, and organized resource management.
