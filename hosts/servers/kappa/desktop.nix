{
  services.xserver = {
    enable = true;
  };
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xrdp = {
    enable = true;
    defaultWindowManager = "startplasma-x11";
    openFirewall = true;
  };

  displayManager.auto.enable = true;
  displayManager.auto.user = "sparks";
}
