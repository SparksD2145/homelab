{
  inputs,
  pkgs,
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
  # davinci-resolve
  ffmpeg

  # Extras
  google-chrome
  freecad
  orca-slicer

  # Voice Dictation
  voxtype-vulkan
  vulkan-loader
]
