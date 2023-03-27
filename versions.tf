terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.2"
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
