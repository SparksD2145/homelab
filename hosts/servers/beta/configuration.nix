{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "beta"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Force nvidia proprietary drivers
  hardware.nvidia.open = lib.mkForce false;
  hardware.nvidia.package = lib.mkForce config.boot.kernelPackages.nvidiaPackages.dc;

  # Set nvidia power limits at boot
  systemd.services.my-boot-script = {
    description = "My custom system boot script";

    # Ensure the service starts late in the boot sequence
    wantedBy = [ "multi-user.target" ];

    # Inject dependencies into the script's PATH environment variable
    path = [
      pkgs.coreutils
      pkgs.bash
      config.hardware.nvidia.package
    ];

    # The exact script commands you want to execute
    script = ''
      # Set power limits on bootup.
      nvidia-smi -i 0 -pl 150
      nvidia-smi -i 1 -pl 175
    '';

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
