{ inputs, self, ... }:
{
  flake.nixosConfigurations.kappa = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ./configuration.nix

      # Disk management
      inputs.disko.nixosModules.disko
      ./disks.nix

      # Shared Host Modules
      self.nixosModules.hosts-global
      self.nixosModules.hosts-power-management
    ];
  };
}
