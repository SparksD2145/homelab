resource "opnsense_dnsmasq_host" "lb-unifi" {
  description = "Unifi Network Application"

  hostname     = "unifi"
  domain       = "sparks.codes"
  ip_addresses = ["10.10.201.2"]
}

resource "opnsense_dnsmasq_host" "lb-emqx" {
  description = "Emqx loadbalancer"

  hostname     = "mqtt"
  domain       = "sparks.codes"
  ip_addresses = ["10.10.201.3"]
}

resource "opnsense_dnsmasq_host" "lb-zwavejs2mqtt" {
  description = "Zwavejs2mqtt loadbalancer"

  hostname     = "zwavejs2mqtt-actual"
  domain       = "sparks.codes"
  ip_addresses = ["10.10.201.4"]
}

resource "opnsense_dnsmasq_host" "lb-s2s-dns" {
  description = "Site-to-site DNS resolver"

  hostname     = "s2s-dns"
  domain       = "sparks.codes"
  ip_addresses = ["10.10.201.6"]
}

resource "opnsense_dnsmasq_host" "lb-backups" {
  description = "backups s3 storage"

  hostname     = "backups"
  domain       = "sparks.codes"
  ip_addresses = ["10.10.201.8"]
}


resource "opnsense_dnsmasq_host" "lb-netboot-tftp" {
  description = "Netboot TFTP server"

  hostname     = "netboot-tftp"
  domain       = "sparks.codes"
  ip_addresses = ["10.10.201.9"]
}

resource "opnsense_dnsmasq_host" "lb-whisper" {
  description = "Whisper STT"

  hostname     = "whisper"
  domain       = "sparks.codes"
  ip_addresses = ["10.10.201.10"]
}

resource "opnsense_dnsmasq_host" "lb-piper" {
  description = "Piper TTS"

  hostname     = "piper-tts"
  domain       = "sparks.codes"
  ip_addresses = ["10.10.201.11"]
}

resource "opnsense_dnsmasq_host" "lb-paperless-dropbox" {
  description = "Paperless-NGX Dropbox"

  hostname     = "paperless-dropbox"
  domain       = "sparks.codes"
  ip_addresses = ["10.10.201.13"]
}
