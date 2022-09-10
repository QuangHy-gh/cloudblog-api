terraform {
  backend "gcs" {
    bucket = "7a5801bbe2c70910-bucket-tfstate"
    prefix = "terraform/state"
  }
}
