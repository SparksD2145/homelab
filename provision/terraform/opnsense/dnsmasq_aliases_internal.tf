resource "opnsense_dnsmasq_host" "lb_internal-services" {
  description     = "Internal Services loadbalancer"
  hostname        = "traefik-internal"
  domain          = "sparks.codes"
  ip_addresses    = ["10.10.201.1"]
  is_local_domain = true

  alias_records = [
    # Internal Services
    "ai.sparks.codes",
    "alertmanager.sparks.codes",
    "bambu-studio.sparks.codes",
    "books-backend.sparks.codes",
    "books.sparks.codes",
    "codeserver-esphome.sparks.codes",
    "codeserver-home.sparks.codes",
    "dashboard.sparks.codes",
    "emqx-dashboard.sparks.codes",
    "esphome.sparks.codes",
    "frigate.sparks.codes",
    "forgejo.sparks.codes",
    "home.sparks.codes",
    "media.sparks.codes",
    "metube.sparks.codes",
    "monitoring.sparks.codes",
    "navidrome.sparks.codes",
    "netboot.sparks.codes",
    "notify.sparks.codes",
    "ollama.sparks.codes",
    "ollama-webui.sparks.codes",
    "paperless.sparks.codes",
    "photos.sparks.codes",
    "pxe.sparks.codes",
    "rook.sparks.codes",
    "router.sparks.codes",
    "speed-test.sparks.codes",
    "torrents.sparks.codes",
    "unifi-dashboard.sparks.codes",
    "zigbee2mqtt.sparks.codes",
    "zwavejs2mqt.sparks.codest",

    # Minecraft Maps
    "superdigdug-flux-map.sparks.codes",
    "superdigdug-newlands-map.sparks.codes",
    "superdigdug-overworld-map.sparks.codes",
    "superdigdug-rectify-map.sparks.codes",
    "superdigdug-sparks-map.sparks.codes",
    "superdigdug-wilderness-map.sparks.codes",
    "cwh11-archive-map.sparks.codes",
    "cwh11-broville-map.sparks.codes",
    "cwh11-original-map.sparks.codes",
    "cwh11-rex-map.sparks.codes",
  ]
}
