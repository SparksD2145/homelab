{ pkgs, config, ... }:
{
  home-manager.users.sparks = {
    programs.opencode = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./opencode.json);
    };

    home.sessionVariables = {
      LOCALAI_API_KEY = "$(cat ${config.sops.secrets.LOCALAI_API_KEY.path})";
    };

  };

  # OpenCode Authentication config
  sops.secrets.LOCALAI_API_KEY = {
    mode = "0440";
    owner = config.users.users.sparks.name;
    group = config.users.users.sparks.group;
    path = "/home/sparks/.local/share/opencode/auth.localai.txt";
    sopsFile = ./auth.localai.sops.txt;
    key = "";
    neededForUsers = true;
  };

}
