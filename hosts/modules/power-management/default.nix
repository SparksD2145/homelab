{ ... }:
{
  flake.nixosModules.hosts-power-management =
    { ... }:
    {
      # Define an on-demand power configuration.
      powerManagement = {
        enable = true;
        cpuFreqGovernor = "ondemand";

        powertop.enable = true;
      };
    };
}
