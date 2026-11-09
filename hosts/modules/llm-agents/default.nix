{ ... }:
{
  flake.nixosModules.hosts-llm-agents =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        opencode
      ];
    };
}
