{ inputs, pkgs, ... }:
with pkgs;
[
  virt-manager
  remmina
  wl-clipboard

  # fun stuff
  obs-studio
  vlc
  discord

  # video editing
  davinci-resolve
  ffmpeg
  incron # Cron-like daemon which handles filesystem events

  # Extras
  google-chrome
]
