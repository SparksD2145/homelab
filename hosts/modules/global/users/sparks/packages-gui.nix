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
  (pkgs.symlinkJoin {
    name = "wrapped-orca-slicer";
    paths = [ pkgs.orca-slicer ]; # The original package
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/orca-slicer \
        --set WEBKIT_DISABLE_DMABUF_RENDERER "1" \
    '';
  })

  # Voice Dictation
  voxtype-vulkan
  vulkan-loader
]
