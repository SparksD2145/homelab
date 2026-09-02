{
  inputs,
  pkgs,
  config,
  ...
}:
with pkgs;
[
  virt-manager
  remmina
  wl-clipboard
  scrcpy

  # development
  opencode
  snip
  bun

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
  voxtype
  (if config.hardware.graphics.enable then "voxtype-vulkan" else "")
]
