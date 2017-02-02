provider "aws" {
  region = "us-east-1"
}

module "account" {
  source = "./account"
  admins = ["rixka"]
}
