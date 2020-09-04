provider "aws" {
  region = "us-east-1"
}

module "td" {
  source          = "../../"
  name_prefix     = "test"
  container_image = "ubuntu"
  container_name  = "test"
}
