{ inputs, self, ... }:
{
  flake.nixosConfigurations.kappa = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ./configuration.nix
      ./desktop.nix

      # Shared Host Modules
      self.nixosModules.hosts-global
      self.nixosModules.hosts-power-management
    ];
  };
}
