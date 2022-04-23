variable "aws_region" {
  type        = string
  description = "The default aws region to use"
}

variable "cloudflare_email" {
  type        = string
  description = "Cloudflare email address"

}

variable "cloudflare_api_key" {
  type        = string
  description = "Cloudflare API Key"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare Website Zone ID"
}

variable "cloudflare_domain" {
  type        = string
  description = "Cloudflare Website Domain"
}

variable "cloudflare_dns_liam_dmarc" {
  type        = string
  description = "Cloudflare Website Domain Liam dmark"
}

variable "cloudflare_dns_liam_dkim" {
  type        = string
  description = "Cloudflare Website Domain Liam dkim"
}

variable "cloudflare_dns_liam_spf" {
  type        = string
  description = "Cloudflare Website Domain Liam spf1"
}
