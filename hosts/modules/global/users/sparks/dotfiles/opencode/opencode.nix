{ pkgs, config, ... }:
{
  home-manager.users.sparks = {
    programs.opencode = {
      enable = false;
      settings = builtins.fromJSON (builtins.readFile ./opencode.json);
    };

    # Openagent config
    home.file.".config/opencode/oh-my-openagent.jsonc" = {
      enable = true;
      force = true;
      target = ".config/opencode/oh-my-openagent.jsonc";
      source = ./oh-my-openagent.jsonc;
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
