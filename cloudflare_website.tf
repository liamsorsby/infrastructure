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
  value           = "v=spf1 include:_spf.mx.cloudflare.net ~all"
  type            = "TXT"
}

resource "cloudflare_record" "sorsby_liam_google_verification" {
  allow_overwrite = true
  zone_id         = var.cloudflare_zone_id
  name            = "sorsby.co"
  value           = "google-site-verification=8NduDgGv3rm2P0V3DdI2ID0s7Ws8mWm7o9G94-NCS1E"
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

resource "cloudflare_email_routing_settings" "email_routing_setting" {
  zone_id = var.cloudflare_zone_id
  enabled = "true"
}

resource "cloudflare_email_routing_rule" "main" {
  zone_id = var.cloudflare_zone_id
  name    = "Catch liam"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "liam@sorsby.co"
  }

  action {
    type  = "forward"
    value = [var.personal_email]
  }
}

resource "cloudflare_email_routing_catch_all" "email_routing" {
  zone_id = var.cloudflare_zone_id
  name    = "catch all"
  enabled = true

  matcher {
    type = "all"
  }

  action {
    type  = "forward"
    value = [var.personal_email]
  }
}
