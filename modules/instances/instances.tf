resource "google_compute_instance" "instance_1" {
  name = "tf-instance-1"
  machine_type = "e2-standard-2"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
  }
   metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT

  allow_stopping_for_update = true
}

resource "google_compute_instance" "instance_2" {

    name = "tf-instance-2"
    machine_type = "e2-standard-2"
    boot_disk {
      initialize_params {
        image="debian-cloud/debian-11"
      }
    }

    
      network_interface {
    network    = "tf-vpc-232759" # Use the VPC name
    subnetwork = ""
    }


    metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT

  allow_stopping_for_update = true
}

resource "google_compute_instance" "instance_3" {
  name         = "tf-instance-897151"
  machine_type = "e2-standard-2"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = "" # Use the VPC name
    subnetwork = "subnet-02"
    }

  metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT

  allow_stopping_for_update = true
}
