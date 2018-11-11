terraform {
  backend "gcs" {
    bucket = "storage-bucket-mkv"
    prefix = "terraform/state/stage"
  }
}
