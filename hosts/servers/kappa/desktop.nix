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

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "sparks";
}
