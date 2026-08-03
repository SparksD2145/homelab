{
  # checkout the example folder for how to configure different disko layouts
  disko.devices = {
    disk = {
      vdb = {
        device = "/dev/disk/by-id/ata-Samsung_SSD_850_EVO_mSATA_250GB_S33GNX0JA14228V";
        type = "disk";

        content = {
          type = "gpt";
          partitions = {
            MBR = {
              type = "EF02"; # for grub MBR
              size = "1M";
              priority = 1; # Needs to be first partition
            };
            ESP = {
              type = "EF00";
              size = "500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
