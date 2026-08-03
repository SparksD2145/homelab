{ inputs, ... }:
{
  flake.nixosModules.remote-build =
    { pkgs, ... }:
    {
      nix = {
        buildMachines = [
          {
            hostName = "beta";
            system = "x86_64-linux";
            protocol = "ssh-ng";
            maxJobs = 4;
            speedFactor = 2;
            supportedFeatures = [
              "nixos-test"
              "benchmark"
              "kvm"
            ];
          }
        ];

        distributedBuilds = true;

        extraOptions = ''
          builders-use-substitutes = true
        '';

        settings = {
          connect-timeout = 5;

          extra-substituters = [
            "ssh-ng://beta"
          ];

          fallback = true;

          trusted-public-keys = [
            "beta:AAAAC3NzaC1lZDI1NTE5AAAAIGtY/arZZUu1mPtkNQ5IT5ktuTg/KLS4BSHJMPFfDMi5"
          ];

          trusted-users = [ "@wheel" ];
        };
      };
    };
}
