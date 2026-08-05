# resource "opnsense_dnsmasq_host" "lb-minecraft" {
#   description = "minecraft loadbalancer"

#   hostname     = "mc"
#   domain       = "sparks.codes"
#   ip_addresses = ["10.10.202.1"]

#   alias_records = [
#     "cwh11.mc.sparks.codes",
#     "cwh11-archive.mc.sparks.codes",
#     "superdigdug.mc.sparks.codes",
#     "superdigdug-overworld.mc.sparks.codes",
#     "superdigdug-sparks.mc.sparks.codes",
#     "superdigdug-newlands.mc.sparks.codes",
#     "superdigdug-rectify.mc.sparks.codes",
#     "superdigdug-wilderness.mc.sparks.codes",
#     "superdigdug-poetry.mc.sparks.codes"
#   ]
# }
