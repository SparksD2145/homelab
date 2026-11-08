{ inputs, ... }:
{
  flake.nixosModules.hosts-llm-agents =
    { pkgs, ... }:
    {
      environment.systemPackages = with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
        opencode
        oh-my-opencode
      ];
    };
}
