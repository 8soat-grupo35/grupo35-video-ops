terraform {
  backend "s3" {
    bucket = "grupo35-terraform-state"
    key = "tf/terraform.tfstate"
    region = "us-east-1"
  }
}

