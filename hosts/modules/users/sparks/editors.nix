{ pkgs, config, ... }:
{
  home-manager.users.sparks = {

    # Vim editor config
    programs.vim = {
      enable = true;
      defaultEditor = true;

      plugins = with pkgs; [
        vimPlugins.nerdtree
        vimPlugins.vim-airline
        vimPlugins.vim-fugitive
        vimPlugins.vim-better-whitespace
        vimPlugins.vim-colorschemes
        vimPlugins.tabular
        vimPlugins.syntastic
        vimPlugins.editorconfig-vim
        vimPlugins.vim-yaml
        vimPlugins.ansible-vim
        vimPlugins.vim-polyglot
      ];

      extraConfig = ''

        set nocompatible              " be iMproved, required
        filetype off                  " required

        " Us spaces instead of tabs
        set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

        " Use syntax highlighting
        syntax on

        " NERDTree show hidden by default
        let NERDTreeShowHidden=1

        colorscheme evening

        set number relativenumber
      '';
    };

    # VSCodium, an alternative to vscode
    programs.vscodium = {
      enable = true;
      package = pkgs.vscodium.fhs;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        redhat.vscode-yaml
        jnoortheen.nix-ide
        editorconfig.editorconfig
        ms-python.python
        ms-azuretools.vscode-docker
        visualstudioexptteam.vscodeintellicode
        eamodio.gitlens
        christian-kohler.path-intellisense
        rust-lang.rust-analyzer
        continue.continue
      ];
    };
  };

  # Continue config
  sops.secrets."users/sparks/continue/config" = {
    mode = "0440";
    owner = config.users.users.sparks.name;
    group = config.users.users.sparks.group;
    path = "/home/sparks/.continue/config.yaml";
    sopsFile = ./dotfiles/continue/config.sops.yaml;
    format = "yaml";
    key = "";
  };
}
