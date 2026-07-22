{ inputs, ... }:
{
  flake.nixosModules.hermes-agent =
    { pkgs, config, ... }:
    {
      imports = [
        inputs.hermes-agent.nixosModules.default
      ];

      services.hermes-agent = {
        enable = true;
        # settings.model.default = "anthropic/claude-sonnet-4";
        environmentFiles = [ config.sops.secrets."hermes-agent/env".path ];
        addToSystemPackages = true;
      };

      sops = {
        secrets."hermes-agent/env" = { };
      };
    };
}
