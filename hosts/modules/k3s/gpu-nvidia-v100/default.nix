{ inputs, ... }:
{
  flake.nixosModules.k3s-gpu-nvidia-v100 =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      hardware.nvidia = {
        # Set to 'true' for modern cards (Turing/Ampere or newer), 'false' for older cards
        open = lib.mkForce false;
        datacenter.enable = true;

        # Disable GSP loading
        gsp.enable = false;

        # Enable Power management
        powerManagement.enable = true;
        nvidiaSettings = lib.mkForce false;
      };

      services.xserver.videoDrivers = lib.mkForce [ ];

      boot.kernelParams = [ "nvidia.NVreg_EnableGpuFirmware=0" ];
    };
}
