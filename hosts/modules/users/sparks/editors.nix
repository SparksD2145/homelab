{ pkgs, ... }:
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
        saoudrizwan.claude-dev
      ];
    };

    # OpenCode config
    home.file.".config/opencode/opencode.json" = {
      enable = true;
      force = true;
      target = ".config/opencode/opencode.json";
      source = ./dotfiles/opencode/opencode.json;
    };
  };
}
