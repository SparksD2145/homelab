resource "opnsense_dnsmasq_host" "mikrotik_switch" {
  hostname           = "mikrotik_switch"
  ip_addresses       = ["10.10.0.2"]
  hardware_addresses = ["2c:c8:1b:cd:8a:37"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "gbepoe_switch" {
  hostname           = "1gbepoe-switch"
  ip_addresses       = ["10.10.0.3"]
  hardware_addresses = ["f0:9f:c2:06:37:aa"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "AP1" {
  hostname           = "AP1"
  ip_addresses       = ["10.10.0.10"]
  hardware_addresses = ["74:ac:b9:bc:58:8c"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "AP2" {
  hostname           = "AP2"
  ip_addresses       = ["10.10.0.11"]
  hardware_addresses = ["74:ac:b9:bc:3c:a4"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "tango" {
  hostname           = "tango"
  ip_addresses       = ["10.10.1.1"]
  hardware_addresses = ["4c:ed:fb:b4:34:7b"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "omega" {
  hostname           = "omega"
  ip_addresses       = ["10.10.1.2"]
  hardware_addresses = ["98:b7:85:22:89:cc"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "idrac_omega" {
  hostname           = "idrac-omega"
  ip_addresses       = ["10.10.1.3"]
  hardware_addresses = ["5c:f9:dd:f8:33:c0"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "lambda" {
  hostname           = "lambda"
  ip_addresses       = ["10.10.1.4"]
  hardware_addresses = ["98:b7:85:22:89:bc"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "idrac_lambda" {
  hostname           = "idrac-lambda"
  ip_addresses       = ["10.10.1.5"]
  hardware_addresses = ["90:b1:1c:54:2f:f2"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "sierra" {
  hostname           = "sierra"
  ip_addresses       = ["10.10.1.11"]
  hardware_addresses = ["00:17:b6:00:69:b3"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "sierra_mgmt" {
  hostname           = "sierra-mgmt"
  ip_addresses       = ["10.10.1.12"]
  hardware_addresses = ["94:c6:91:d9:d7:25"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "romeo" {
  hostname           = "romeo"
  ip_addresses       = ["10.10.1.13"]
  hardware_addresses = ["00:17:b6:00:73:1a"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "romeo_mgmt" {
  hostname           = "romeo-mgmt"
  ip_addresses       = ["10.10.1.14"]
  hardware_addresses = ["94:c6:91:d6:33:5a"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "xray" {
  hostname           = "xray"
  ip_addresses       = ["10.10.1.15"]
  hardware_addresses = ["00:17:b6:00:74:a8"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "kappa" {
  hostname           = "kappa"
  ip_addresses       = ["10.10.1.16"]
  hardware_addresses = ["90:2b:34:59:1e:1f"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "beta_mgmt" {
  hostname           = "beta-mgmt"
  ip_addresses       = ["10.10.1.17"]
  hardware_addresses = ["b4:2e:99:33:ab:13"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "beta" {
  hostname           = "beta"
  ip_addresses       = ["10.10.1.18"]
  hardware_addresses = ["b4:2e:99:33:ab:11"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "whiskey" {
  hostname           = "whiskey"
  ip_addresses       = ["10.10.1.19"]
  hardware_addresses = ["00:17:b6:00:73:86"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "alpha" {
  hostname           = "alpha"
  ip_addresses       = ["10.10.100.1"]
  hardware_addresses = ["70:85:c2:4c:aa:4e"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "alpha_wol" {
  hostname           = "alpha-wol"
  ip_addresses       = ["10.10.100.2"]
  hardware_addresses = ["70:85:c2:4c:aa:4c"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "sparks_pixel" {
  hostname           = "sparks-pixel"
  ip_addresses       = ["10.10.101.1"]
  hardware_addresses = ["b0:d5:fb:bb:4e:5c"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "SOPHIE_DESKTOP" {
  hostname           = "SOPHIE-DESKTOP"
  ip_addresses       = ["10.10.102.1"]
  hardware_addresses = ["f0:2f:74:30:49:84"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "sophie_ipad" {
  hostname           = "sophie-ipad"
  ip_addresses       = ["10.10.102.2"]
  hardware_addresses = ["26:6e:b9:16:d6:fa"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "sophie_steamdeck" {
  hostname           = "sophie-steamdeck"
  ip_addresses       = ["10.10.102.3"]
  hardware_addresses = ["50:5a:65:80:d7:85"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "bambu_printer" {
  hostname           = "3d-printer"
  ip_addresses       = ["10.10.103.1"]
  hardware_addresses = ["94:a9:90:2a:03:b8"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "epson_printer" {
  hostname           = "epson-printer"
  ip_addresses       = ["10.10.103.2"]
  hardware_addresses = ["64:c6:d2:5b:cb:2d"]
  domain             = "sparks.codes"
  is_local_domain    = true
}

resource "opnsense_dnsmasq_host" "bw_printer" {
  hostname           = "bw-printer"
  ip_addresses       = ["10.10.103.3"]
  hardware_addresses = ["20:0b:74:99:49:4a"]
  domain             = "sparks.codes"
  is_local_domain    = true
}
