{ config, pkgs, ... }:

{
  # Allow unfree packages (required for NVIDIA drivers)
  nixpkgs.config.allowUnfree = true;

  # Enable OpenGL/Graphics
  hardware.graphics.enable = true;

  # Load NVIDIA drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    branch = "legacy_580";
  };

  # Enable Docker and CDI features
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      features = {
        cdi = true;
      };
    };
  };

  # Enable the NVIDIA Container Toolkit
  hardware.nvidia-container-toolkit.enable = true;
}
