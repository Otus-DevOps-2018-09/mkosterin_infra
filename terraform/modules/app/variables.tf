variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the privete key which use for provisioners"
}

variable zone {
  description = "Zone for create instance"
  default     = "europe-west1-b"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_internal_ip {
  description = "mongod IP address"
}

variable deploy_app {
  description = "if 1 then deploy reddit app"
  default = "1"
}

