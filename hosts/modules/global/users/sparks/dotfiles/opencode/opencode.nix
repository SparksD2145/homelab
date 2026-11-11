{ pkgs, config, ... }:
{
  home-manager.users.sparks = {
    programs.opencode = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./opencode.json);
    };

    home.sessionVariables = {
      LOCALAI_API_KEY = "$(yq -r '.local_ai_key' ${config.sops.secrets.LOCALAI_API_KEY.path})";
    };

  };

  # OpenCode Authentication config
  sops.secrets.LOCALAI_API_KEY = {
    mode = "0440";
    owner = config.users.users.sparks.name;
    group = config.users.users.sparks.group;
    sopsFile = ./auth.sops.yaml;
    key = "";
  };
}
