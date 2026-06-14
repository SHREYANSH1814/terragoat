
  profile = var.profile
  region  = var.region
}

provider "aws" {
  alias  = "plain_text_access_keys_provider"
  region = "us-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}
variable "access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
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
