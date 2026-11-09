{ inputs, self, ... }:
{
  flake.nixosConfigurations.delta = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ./configuration.nix

      # Nix-Flatpak module for managing flatpaks declaratively
      inputs.nix-flatpak.nixosModules.nix-flatpak

      # Shared Host Modules
      self.nixosModules.hosts-global
      self.nixosModules.hosts-workstations-shared
    ];
  };
}
