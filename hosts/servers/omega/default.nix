{ inputs, self, ... }:
{
  flake.nixosConfigurations.omega = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ./configuration.nix

      # Shared Host Modules
      self.nixosModules.hosts-global
      self.nixosModules.hosts-power-management

      # K3s
      self.nixosModules.k3s-agent
    ];
  };
}
