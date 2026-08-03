{ inputs, self, ... }:
{
  flake.nixosConfigurations.lambda = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ./configuration.nix

      # Shared Host Modules
      self.nixosModules.hosts-global
      self.nixosModules.hosts-power-management
    ];
  };
}
