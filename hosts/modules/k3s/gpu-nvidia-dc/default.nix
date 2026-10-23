{ inputs, ... }:
{
  flake.nixosModules.k3s-gpu-nvidia-dc =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      # Allow unfree packages and accept the NVIDIA driver license
      nixpkgs.config.allowUnfree = true;
      nixpkgs.config.nvidia.acceptLicense = true;

      hardware.nvidia.datacenter.enable = true;

      hardware.nvidia = {
        # Set to 'true' for modern cards (Turing/Ampere or newer), 'false' for older cards
        open = false;

        # Use the Datacenter driver tracking package
        package = config.boot.kernelPackages.nvidiaPackages.dc;

        # Disable GSP loading
        gsp.enable = false;

        # Enable Power management
        powerManagement.enable = true;

        # Enable persistence daemon to keep driver loaded (standard for headless servers)
        nvidiaPersistenced = true;

        nvidiaSettings = false;
      };

      boot.kernelParams = [ "nvidia.NVreg_EnableGpuFirmware=0" ];

      # Enable the graphics driver layer
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      # Force-load video drivers even on headless server environments
      # services.xserver.videoDrivers = [ "nvidia" ];

      # Enable NVIDIA Container Toolkit & CDI Support
      hardware.nvidia-container-toolkit.enable = true;
      hardware.nvidia-container-toolkit.mount-nvidia-executables = true;

      # Configure containerd to use the nvidia-container-runtime for GPU support in containers
      services.k3s.containerdConfigTemplate = ''
        {{ template "base" . }}

        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia]
          privileged_without_host_devices = false
          runtime_engine = ""
          runtime_root = ""
          runtime_type = "io.containerd.runc.v2"

        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia.options]
          BinaryName = "${pkgs.nvidia-container-toolkit.tools}/bin/nvidia-container-runtime.cdi"
      '';
    };
}
