
  profile = var.profile
  region  = var.region
}

provider "aws" {
  alias  = "plain_text_access_keys_provider"
  region = "us-west-1"
  # Use environment variables or shared credentials file for access_key and secret_key
}

terraform {
  backend "s3" {
    encrypt = true
  }

provider "aws" {
  alias      = "plain_text_access_keys_provider"
  region     = "us-west-1"
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

terraform {
  backend "s3" {
    encrypt = true
  }
}
