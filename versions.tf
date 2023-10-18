terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.21.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

terraform {
  cloud {
    organization = "liamsorsby"

    workspaces {
      name = "github"
    }
  }
}
