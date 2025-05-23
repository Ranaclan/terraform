provider "google" {
    project = var.project_id
    region = var.app_region
    zone = var.instance_zone
}

resource "google_compute_instance" "db_instance" {
    name = var.db_name
    machine_type = var.machine_type
    zone = var.instance_zone

    boot_disk {
      initialize_params {
        image = var.db_image
      }
    }

    network_interface {
      network = "default"
    }

    tags = ["db-server"]
}

resource "google_compute_instance" "app_instance" {
    name = var.app_name
    machine_type = var.machine_type
    zone = var.instance_zone

    boot_disk {
      initialize_params {
        image = var.app_image
      }
    }

    network_interface {
      network = "default"
      access_config {
        network_tier = "STANDARD"
      }
    }

    metadata_startup_script = "#!/bin/bash\ncd spartaAppDeployment/app\nsleep 10\nexport DB_HOST=mongodb://${google_compute_instance.db_instance.network_interface[0].network_ip}/posts\npm2 start app.js"

    tags = ["http-server"]
}