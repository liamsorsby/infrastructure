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
