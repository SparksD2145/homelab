{ self, ... }:
{
  flake.nixosModules.hosts-servers =
    { pkgs, ... }:
    {
      # Import shared modules
      imports = [
        self.nixosModules.hosts-power-management
      ];

      # Systemd timer for poweroff at 11:30 PM nightly.
      systemd.timers."poweroff-nightly" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "*-*-* 23:30:00 America/Chicago";
          Unit = "poweroff-nightly.service";
        };
      };
      systemd.services."poweroff-nightly" = {
        script = ''
          set -eu
          ${pkgs.systemd}/bin/poweroff
        '';
        serviceConfig = {
          Type = "oneshot";
          User = "root";
        };
      };
    };
}
