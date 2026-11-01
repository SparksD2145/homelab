{ config, pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = true;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  # Autologin
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "sparks";

  # Remote Desktop
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session"; # gnome wayland session
  services.gnome.gnome-remote-desktop.enable = true; # needs gnome-remote-desktop bWackend to work!!
  networking.firewall.allowedTCPPorts = [ 3389 ];

  environment.shells = with pkgs; [ zsh ];
  environment.systemPackages = with pkgs; [
    obs-studio
  ];
}
