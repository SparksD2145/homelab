{
  # K3s supplemental
  services.k3s.nodeTaint = [
    "machine-vhs=true:NoSchedule"
  ];
}
