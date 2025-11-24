Terraform GCP Project: VM, Storage, VPC, and Firewall Setup

This project demonstrates how to use Terraform to deploy and manage resources on Google Cloud Platform (GCP). The project includes creating virtual machines (VMs), a storage bucket, a VPC with subnets, and a firewall rule using Terraform modules.

Project Structure
.
├── main.tf                # Root Terraform configuration
├── variables.tf           # Root variables
├── modules/
│   ├── instances/
│   │   ├── instances.tf    # VM resources
│   │   ├── outputs.tf      # VM outputs
│   │   └── variables.tf    # VM variables
│   └── storage/
│       ├── storage.tf      # Storage bucket
│       ├── outputs.tf      # Storage outputs
│       └── variables.tf    # Storage variables
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
