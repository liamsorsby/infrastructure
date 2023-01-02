# Sorsby.co

resource "cloudflare_record" "sorsby_liam_dmarc" {
  allow_overwrite = true
  zone_id         = var.cloudflare_zone_id
  name            = "_dmarc"
  value           = var.cloudflare_dns_liam_dmarc
  type            = "TXT"
}

resource "cloudflare_record" "sorsby_liam_dkim" {
  allow_overwrite = true
  zone_id         = var.cloudflare_zone_id
  name            = "*._domainkey"
  value           = "v=DKIM1; p="
  type            = "TXT"
}

resource "cloudflare_record" "sorsby_liam_spf" {
  allow_overwrite = true
  zone_id         = var.cloudflare_zone_id
  name            = "sorsby.co"
  value           = "v=spf1 -all"
  type            = "TXT"
}

resource "cloudflare_record" "vercel_A_record" {
  name    = "@"
  type    = "A"
  zone_id = var.cloudflare_zone_id
  value   = "76.76.21.21"
}

resource "cloudflare_record" "vercel_CNAME_record" {
  name    = "www"
  type    = "CNAME"
  zone_id = var.cloudflare_zone_id
  value   = "cname.vercel-dns.com."
}

resource "cloudflare_ruleset" "transform_uri_remove_headers" {
  zone_id     = var.cloudflare_zone_id
  name        = "Transform rule for removing HTTP server Header"
  description = "Remove Headers before reaching client"
  kind        = "zone"
  phase       = "http_response_headers_transform"
  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "server"
        operation = "set"
        value     = "redacted"
      }
    }

    expression  = "true"
    description = "Remove Server Header"
    enabled     = true
  }
}
