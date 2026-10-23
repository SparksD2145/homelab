{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d94393ef-2307-4e02-886b-b892d58c519d";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D827-3CC4";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  # Force nvidia proprietary drivers
  hardware.nvidia.open = lib.mkForce false;
  hardware.nvidia.package = lib.mkForce config.boot.kernelPackages.nvidiaPackages.legacy_580;
  hardware.nvidia.modesetting.enable = true;

  # Set nvidia power limits at boot
  # systemd.services.nvidia-set-powerlimits = {
  #   description = "Sets power limits in Watts for Nvidia compute cards";

  #   # Ensure the service starts late in the boot sequence
  #   wantedBy = [ "multi-user.target" ];

  #   # Inject dependencies into the script's PATH environment variable
  #   path = [
  #     pkgs.coreutils
  #     pkgs.bash
  #     config.hardware.nvidia.package
  #   ];

  #   # The exact script commands you want to execute
  #   script = ''
  #     # Set power limits on bootup.
  #     nvidia-smi -i 0 -pl 150
  #     nvidia-smi -i 1 -pl 175
  #   '';

  #   serviceConfig = {
  #     Type = "oneshot";
  #     RemainAfterExit = true;
  #   };
  # };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
