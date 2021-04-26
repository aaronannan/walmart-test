// vm for wordpress
resource "google_compute_instance" "walmart-wordpress" {
  name         = each.value
  for_each     = toset(var.vm_wordpress)
  machine_type = "e2-medium"
  zone         = "us-west1-a"



  tags = ["walmart-vm"]

  boot_disk {
    initialize_params {
      image = var.wordpress_image_type
    }
  }
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network    = "walmart-vpc"
    subnetwork = "private-subnet"
    access_config {
      // Ephemeral IP
    }
  }
}


// vm for sql
resource "google_compute_instance" "walmart-sql" {
  name         = each.value
  for_each     = toset(var.vm_sql)
  machine_type = "e2-medium"
  zone         = "us-west1-a"


  tags = ["walmart-vm"]

  boot_disk {
    initialize_params {
      image = var.sql_image_type
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network            = "walmart-vpc"
    subnetwork         = "private-subnet"
    subnetwork_project = "walmart"

    access_config {
      // Ephemeral IP
    }
  }
}

// vm for f5
resource "google_compute_instance" "walmart-f5" {
  name         = each.value
  for_each     = toset(var.vm_f5)
  machine_type = "e2-medium"
  zone         = "us-west1-a"



  tags = ["walmart-vm"]

  boot_disk {
    initialize_params {
      image = var.f5_image_type
    }
  }
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network    = "walmart-vpc"
    subnetwork = "public-subnet"
    access_config {
      // Ephemeral IP
    }
  }
}
