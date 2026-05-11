terraform {
  backend "s3" {
    bucket = "clouddevops-tf-state"
    key    = "clouddevops/terraform.tfstate"
    region = "us-east-1"
  }
}
