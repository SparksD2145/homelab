{ pkgs, config, ... }:
{
  home-manager.users.sparks = {
    programs.opencode = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./opencode.json);
    };
  };

  # OpenCode Authentication config
  sops.secrets."users/sparks/opencode/auth" = {
    mode = "0440";
    owner = config.users.users.sparks.name;
    group = config.users.users.sparks.group;
    path = "/home/sparks/.local/share/opencode/auth.json";
    sopsFile = ./auth.sops.json;
    format = "json";
    key = "";
  };
}
