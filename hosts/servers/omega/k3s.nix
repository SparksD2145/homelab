{
  # K3s supplemental
  services.k3s.nodeTaint = [
    "machine-cold=true:NoSchedule"
  ];
}
